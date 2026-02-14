{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

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
  ];

  nix.settings = {
    experimental-features = "nix-command flakes";

    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
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

  nix.settings.auto-optimise-store = true;

  system.stateVersion = "26.05";
}
