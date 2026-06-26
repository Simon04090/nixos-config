{
  description = "NixOS systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager }:
    let username = "simon";
    in {

      nixosConfigurations.edgedancer = nixpkgs.lib.nixosSystem {
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix
        ];
        specialArgs = {
          inherit username;
        };
      };

      homeConfigurations.simon = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home.nix
          plasma-manager.homeModules.plasma-manager
        ];
        extraSpecialArgs = {
          inherit username;
        };
      };

  };
}
