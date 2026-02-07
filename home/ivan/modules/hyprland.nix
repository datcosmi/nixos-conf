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

    ./hypr/modules/hyprscrolling.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
    ];
  };
}
