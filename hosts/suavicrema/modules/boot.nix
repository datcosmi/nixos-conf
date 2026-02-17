{pkgs, ...}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      enableCryptodisk = true;
      # configurationLimit = 6;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  boot.initrd.luks.devices.cryptroot.allowDiscards = true;
}
