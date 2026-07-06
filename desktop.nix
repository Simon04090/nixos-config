{ pkgs, lib, ... } : {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg)
    [
      "google-chrome"
      "clion"
      "pycharm"
      "rust-rover"
    ];

  home.packages = with pkgs; [
      jetbrains.clion
      jetbrains.pycharm
      jetbrains.rust-rover
  ];

  programs.google-chrome = {
      enable = true;
      plasmaSupport = true;
  };


}
