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
    display = {
      internalBacklight = false;
      ddc = true;
    };
  };

  system.stateVersion = "26.05";
}
