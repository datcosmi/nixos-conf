{lib, ...}: {
  imports = [
    ../../modules/system
    ../../profiles
    ./hardware-configuration.nix
    ./disko.nix
    ../../modules/system/users/ivan.nix
  ];

  networking.hostName = "suavicrema";

  my.hardware = {
    gpu = "nvidia";
    host = "desktop";

    display = {
      internalBacklight = false;
      ddc = true;
    };
  };

  my.profiles = ["base" "personal" "gaming"];

  system.stateVersion = "26.05";
}
