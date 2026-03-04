{...}: {
  imports = [
    ../modules/system/hardware
    ../modules/system/boot
    ../modules/system/boot/nvidia.nix
    ../modules/system/graphics
    ../modules/system/graphics/nvidia.nix
    ../modules/system/wm/niri.nix

    ../modules/system/networking.nix
    ../modules/system/sound.nix
    ../modules/system/services.nix
    ../modules/system/users.nix
    ../modules/system/packages.nix
    ../modules/system/shell.nix
    ../modules/system/greeter.nix

    ../modules/system/desktop-apps.nix
    ../modules/system/cachix.nix
  ];
}
