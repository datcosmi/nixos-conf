{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.features.system.networking.avahi;
in {
  options.my.features.system.networking.avahi.enable =
    lib.mkEnableOption "avahi";

  config = lib.mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;

      publish = {
        enable = true;
        userServices = true;
      };
    };
  };
}
