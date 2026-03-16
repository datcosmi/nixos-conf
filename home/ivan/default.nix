{...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/terminal.nix
    ../../modules/home/env.nix
    ../../modules/home/utils.nix
    ../../modules/home/scripts.nix
    ../../modules/home/ssh.nix
    ../../modules/home/default-apps.nix
    ../../modules/home/desktop-apps.nix
    ../../modules/home/themes
    ../../modules/home/dev.nix
    ../../modules/home/clipboard.nix
  ];

  my.theme = {
    palette = "catppuccin-mocha";
    gtk = "adwaita-dark";
    cursor = "bibata-modern";
  };

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
