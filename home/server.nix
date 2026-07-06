{ lib, username, ... } : {
  programs = {
    nh = {
      enable = true;
      homeFlake = "/home/${username}/nixos-config";
    };

    zsh.defaultKeymap = "emacs";
  };
  home.homeDirectory = lib.mkForce "/scratch/${username}/home";
}
