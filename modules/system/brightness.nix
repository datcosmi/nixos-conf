{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware;
in {
  config = lib.mkIf (cfg.host == "desktop") {
    hardware.i2c.enable = true;

    boot.kernelModules = [
      "i2c-dev"
    ];

    environment.systemPackages = with pkgs; [
      ddcutil
      i2c-tools
    ];

    users.users.ivan.extraGroups = ["i2c"];

    services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';
  };
}
