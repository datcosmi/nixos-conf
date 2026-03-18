{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  cfg = config.my.desktop;
in {
  config = lib.mkIf (lib.elem "niri" cfg.wms) {
    programs.niri = {
      enable = true;
      package = inputs.niri.packages.${system}.niri;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
      alacritty
    ];

    environment.etc."xdg/wayland-sessions/niri.desktop".text = ''
      [Desktop Entry]
      Name=Niri
      Comment=Scrollable-tiling Wayland compositor
      Exec=${config.programs.niri.package}/bin/niri
      Type=Application
      DesktopNames=Niri
    '';
  };
}
