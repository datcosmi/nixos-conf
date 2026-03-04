{lib, ...}: {
  imports = [
    ../../profiles/desktop.nix
    ./hardware-configuration.nix
    ./disko.nix
  ];

  networking.hostName = "suavicrema";

  my.hardware.gpu = "nvidia-turing";

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    trusted-users = ["root" "ivan"];
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
