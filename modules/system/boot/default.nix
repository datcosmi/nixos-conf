{pkgs, ...}: {
  imports = [
    ./nvidia.nix
  ];

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
      };
    };

    kernelPackages = pkgs.linuxPackages_6_12;

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_background_ratio" = 5;
      "vm.dirty_ratio" = 10;
    };

    kernelParams = [
      "mem_sleep_default=deep"
      "elevator=mq-deadline"
    ];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 100;
  };
}
