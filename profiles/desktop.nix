{...}: {
  imports = [
    ../modules/system/wm/niri

    ../modules/system/networking
    ../modules/system/audio.nix
    ../modules/system/services.nix
    ../modules/system/memory.nix
    ../modules/system/utils
    ../modules/system/display.nix
    ../modules/system/shell.nix
    ../modules/system/login/tuigreet.nix

    ../modules/system/desktop
    ../modules/system/gaming.nix
    ../modules/system/cachix.nix
  ];
}
