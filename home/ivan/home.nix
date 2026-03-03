{...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/terminal.nix
    ../../modules/home/env.nix
    ../../modules/home/utils.nix
    ../../modules/home/scripts.nix
    ../../modules/home/ssh.nix
    ../../modules/home/defaults.nix
    ../../modules/home/desktop-apps.nix
    ../../modules/home/theme.nix
    ../../modules/home/dev.nix
    ../../modules/home/clipboard.nix
  ];

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
