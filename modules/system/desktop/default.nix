{
  lib,
  config,
  ...
}: let
  cfg = config.my.features.desktop;
in {
  imports = [
    ./apps
    ./fonts.nix
    ./wm
  ];

  options.my.features.desktop.enable =
    lib.mkEnableOption "desktop environment";

  config = lib.mkIf cfg.enable {
    my.features.desktop = {
      niri.enable = lib.mkDefault true;
      apps.enable = lib.mkDefault true;
      fonts.enable = lib.mkDefault true;
    };
  };
}
