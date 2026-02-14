{...}: {
  imports = [
    ./modules/shell.nix
    ./modules/terminal.nix
    ./modules/env.nix
    ./modules/utils.nix
    ./modules/scripts.nix
    ./modules/ssh.nix
    ./modules/defaults.nix
    ./modules/desktop-apps.nix
    ./modules/graphics.nix
    ./modules/theme.nix
    ./modules/dev.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
