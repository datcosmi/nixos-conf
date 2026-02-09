{pkgs, ...}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      enableCryptodisk = true;
      configurationLimit = 6;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  boot.initrd.luks.devices.cryptroot = {
    device = "/dev/disk/by-uuid/aeded548-2eba-44c8-ac4e-21e3f1e1f87c";
    preLVM = true;
  };
}
