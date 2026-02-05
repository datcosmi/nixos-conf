{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hypr/modules/monitors.nix
    ./hypr/modules/input.nix
    ./hypr/modules/bindings.nix
    ./hypr/modules/env.nix
    ./hypr/modules/autostart.nix
    ./hypr/modules/looknfeel.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
  };
}
