{lib, ...}: {
  imports = [
    ../../profiles/desktop.nix
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/system/users/ivan.nix
  ];

  networking.hostName = "suavicrema";
  my.hardware.gpu = "nvidia";
  # home-manager.users.ivan = import ../../home/ivan;

  system.stateVersion = "26.05";
}
