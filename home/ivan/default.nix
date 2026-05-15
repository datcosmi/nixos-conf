{...}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/terminal.nix
    ../../modules/home/env.nix
    ../../modules/home/scripts
    ../../modules/home/desktop
    ../../modules/home/themes
    ../../modules/home/dev
    ../../modules/home/cli/protonvpn.nix
  ];

  my.theme = {
    palette = "catppuccin-mocha";
    gtk = "adwaita";
    cursor = "bibata-ice";
  };

  my.wm = {
    niri = true;
  };

  custom.waylandLockSuspend = {
    enable = true;
    lockTimeout = 300;
    screenOffTimeout = 330;
    suspendTimeout = 900;
    gracePeriod = 5;
    fontFamily = "JetBrainsMono Nerd Font";
    blurPasses = 3;
  };

  programs.hardened-firefox.enable = true;

  home.username = "ivan";
  home.homeDirectory = "/home/ivan";
  home.stateVersion = "26.05";
}
