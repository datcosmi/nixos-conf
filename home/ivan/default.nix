{...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/terminal.nix
    ../../modules/home/env.nix
    ../../modules/home/scripts
    ../../modules/home/desktop
    ../../modules/home/themes
    ../../modules/home/dev
  ];

  my.theme = {
    palette = "catppuccin-mocha";
    gtk = "adwaita-dark";
    cursor = "bibata-modern";
  };

  my.desktop = {
    wms = ["niri"];
  };

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
