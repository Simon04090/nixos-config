{ config, pkgs, username, ... }:
{
  home.packages = with pkgs; [
      nix-output-monitor
      google-chrome
      jetbrains.clion
      jetbrains.pycharm
      jetbrains.rust-rover
  ];

  home.username = username;

  home.homeDirectory = "/home/${username}";

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Simon Kammermeier";
          email = "simon.kammermeier@tum.de";
        };
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
