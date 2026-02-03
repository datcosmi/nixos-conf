{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hypr/modules/monitors.nix
    ./hypr/modules/input.nix
    ./hypr/modules/windows.nix
    ./hypr/modules/bindings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };
}
