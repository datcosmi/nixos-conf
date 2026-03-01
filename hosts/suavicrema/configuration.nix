{lib, ...}: {
  imports = [
    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/graphics.nix
    ../../modules/system/sound.nix
    ../../modules/system/services.nix
    ../../modules/system/users.nix
    ../../modules/system/packages.nix
    ../../modules/system/shell.nix
    ../../modules/system/greeter.nix

    ../../modules/system/desktop-apps.nix
    ../../modules/system/cachix.nix
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than-10d";
  };

  nix.optimise = {
    automatic = true;
    dates = ["daily"];
    persistent = true;
  };

  system.stateVersion = "26.05";
}
