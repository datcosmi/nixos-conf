{...}: {
  imports = [
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/gtk.nix
    ./modules/packages.nix
    ./modules/session.nix
    ./modules/services.nix
    ./modules/utils.nix
    ./modules/scripts.nix
    ./modules/ssh.nix
    ./modules/default-apps.nix
    ./modules/desktop-apps.nix
    ./modules/hyprland.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
