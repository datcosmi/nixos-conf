{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/monitors.nix
    ./modules/input.nix
    ./modules/bindings.nix
    ./modules/env.nix
    ./modules/autostart.nix
    ./modules/looknfeel.nix

    ./modules/plugins.nix

    ./idle.nix
    ./lock.nix
    ./hypr-monitor-fix.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };

  home.packages = with pkgs; [
    grim
    slurp
  ];
}
