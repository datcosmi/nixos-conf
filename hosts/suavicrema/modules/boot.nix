{pkgs, ...}: {
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = false;
        enableCryptodisk = false;
      };
    };

    kernelPackages = pkgs.linuxPackages_6_12;

    initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_background_ratio" = 5;
      "vm.dirty_ratio" = 10;
    };

    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "elevator=mq-deadline"
      "nvidia.NVreg_OpenRmEnableUnsupportedGpus=1"
    ];

    blacklistedKernelModules = ["nouveau"];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 100;
  };

  fileSystems = {
    "/var/log".neededForBoot = true;
    "/.snapshots".neededForBoot = false;
  };
}
