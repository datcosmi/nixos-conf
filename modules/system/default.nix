{
  imports = [
    ./hardware
    ./boot
    ./graphics
    ./core/nix.nix

    ./networking
    ./audio.nix
    ./services
    ./memory.nix
    ./env.nix
    ./utils
    ./gaming.nix
    ./display.nix
    ./login/tuigreet.nix

    ./desktop
    ./cachix.nix
  ];
}
