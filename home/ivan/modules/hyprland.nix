{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../hypr/modules/monitors.nix
    ../hypr/modules/input.nix
    ../hypr/modules/bindings.nix
    ../hypr/modules/env.nix
    ../hypr/modules/autostart.nix
    ../hypr/modules/looknfeel.nix

    ../hypr/modules/plugins.nix

    ../hypr/idle.nix
    ../hypr/lock.nix
    ../hypr/hypr-monitor-fix.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    # plugins = [
    #   pkgs.hyprlandPlugins.hyprscrolling
    #   # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
    # ];
  };
}
