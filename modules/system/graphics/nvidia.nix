{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware;
in {
  config = lib.mkIf (cfg.gpu == "nvidia") {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      videoAcceleration = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.graphics.extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
}
