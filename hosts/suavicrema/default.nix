{lib, ...}: {
  imports = [
    ../../profiles/desktop.nix
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/system/users/ivan.nix
  ];

  networking.hostName = "suavicrema";
  my.hardware.gpu = "nvidia";

  system.stateVersion = "26.05";
}
