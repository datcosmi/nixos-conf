{ ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/gtk.nix
    ./modules/packages.nix
    ./modules/session.nix
    ./modules/services.nix
    ./modules/utils.nix
    ./modules/ssh.nix

    ./modules/tmux.nix
    ./modules/rofi.nix
    ./scripts/waybar-media-player.nix
    ./modules/catppuccin.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
