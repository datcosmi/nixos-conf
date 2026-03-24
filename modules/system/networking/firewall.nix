{
  lib,
  config,
  ...
}: let
  cfg = config.my.features.system.firewall;
in {
  options.my.features.system.firewall.enable =
    lib.mkEnableOption "firewall";

  config = lib.mkIf cfg.enable {
    networking.firewall = {
      enable = true;

      allowPing = true;
      checkReversePath = "loose";

      trustedInterfaces = [
        "enp5s0"
      ];
    };
  };
}
