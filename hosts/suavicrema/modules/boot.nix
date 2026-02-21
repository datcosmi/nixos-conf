{pkgs, ...}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
      enableCryptodisk = false;
      copyKernels = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
  };

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 100;
  };
}
