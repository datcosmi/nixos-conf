{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware;
in {
  config = lib.mkMerge [
    (lib.mkIf (cfg.gpu == "nvidia") {
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
    })

    (lib.mkIf (cfg.gpu == "nvidia" && cfg.hybrid) {
      hardware.nvidia.prime = {
        offload.enable = true;
        intelBusId = cfg.prime.intelBusId;
        nvidiaBusId = cfg.prime.nvidiaBusId;
      };

      hardware.nvidia.powerManagement.finegrained = true;
    })
  ];
}
