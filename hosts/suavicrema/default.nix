{lib, ...}: {
  imports = [
    ../../profiles/desktop.nix
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/system/users/ivan.nix
  ];

  networking.hostName = "suavicrema";
  my.hardware = {
    gpu = "nvidia";
    host = "desktop";
  };

  system.stateVersion = "26.05";
}
