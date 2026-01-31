{...}: {
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
    ./modules/catppuccin.nix
    ./modules/fastfetch.nix
    ./modules/starship.nix

    ./scripts/waybar-media-player.nix
    ./scripts/hyprland-audio-switcher.nix

    ./modules/hypr/idle.nix
    ./modules/hypr/lock.nix
    ./modules/hypr/hypr-monitor-fix.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
  # programs.home-manager.enable = true;
}
