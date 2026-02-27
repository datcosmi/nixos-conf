{lib, ...}: {
  imports = [
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/graphics.nix
    ./modules/sound.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/shell.nix
    ./modules/greeter.nix

    ./modules/desktop-apps.nix
    ./cachix.nix
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
