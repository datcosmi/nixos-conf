{...}: {
  imports = [
    ../modules/system/hardware
    ../modules/system/boot
    ../modules/system/graphics
    ../modules/system/wm/niri

    ../modules/system/core/nix.nix
    ../modules/system/networking
    ../modules/system/sound.nix
    ../modules/system/services.nix
    ../modules/system/memory.nix
    ../modules/system/utils.nix
    ../modules/system/brightness.nix
    ../modules/system/fonts.nix
    ../modules/system/shell.nix
    ../modules/system/login/tuigreet.nix

    ../modules/system/desktop-apps.nix
    ../modules/system/gaming.nix
    ../modules/system/cachix.nix
  ];
}
