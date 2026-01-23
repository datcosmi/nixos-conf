{ ... }:

{
  imports = [
    ./shell.nix
    ./terminal.nix
    ./gtk.nix
    ./packages.nix
    ./session.nix
    ./services.nix
    ./utils.nix
    ./ssh.nix

    ./tmux.nix
    ./rofi.nix
    ./waybar/waybar-media-player.nix
    ./catppuccin.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
