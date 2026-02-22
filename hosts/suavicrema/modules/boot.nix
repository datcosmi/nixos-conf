{pkgs, ...}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
      enableCryptodisk = false;
      copyKernels = true;

      #   extraEntries = ''
      #   menuentry "Arch Linux" --class arch --class gnu-linux --class os {
      #     insmod ext2
      #     insmod lvm
      #     insmod btrfs
      #     search --no-floppy --label --set=root BOOT
      #     linux /vmlinuz-linux \
      #       cryptdevice=UUID=YOUR_LUKS_UUID:crypt:allow-discards \
      #       root=/dev/vg/arch \
      #       rootflags=subvol=@ \
      #       rw quiet loglevel=3 \
      #       nvidia_drm.modeset=1 \
      #       nvidia.NVreg_PreserveVideoMemoryAllocations=1
      #     initrd /amd-ucode.img /initramfs-linux.img
      #   }
      #
      #   menuentry "Arch Linux (fallback initramfs)" --class arch --class gnu-linux {
      #     insmod ext2
      #     insmod lvm
      #     insmod btrfs
      #     search --no-floppy --label --set=root BOOT
      #     linux /vmlinuz-linux \
      #       cryptdevice=UUID=YOUR_LUKS_UUID:crypt:allow-discards \
      #       root=/dev/vg/arch \
      #       rootflags=subvol=@ \
      #       rw
      #     initrd /amd-ucode.img /initramfs-linux-fallback.img
      #   }
      # '';
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];

  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 10;
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
