{
  description = "NixOS systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
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


  };
}
