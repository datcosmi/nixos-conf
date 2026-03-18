{...}: {
  imports = [
    ../modules/system/networking
    ../modules/system/audio.nix
    ../modules/system/services.nix
    ../modules/system/memory.nix
    ../modules/system/utils
    ../modules/system/display.nix
    ../modules/system/login/tuigreet.nix

    ../modules/system/desktop
    ../modules/system/cachix.nix
  ];
}
