{lib, ...}: {
  imports = [
    ../../profiles/base.nix
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

  my.features = {
    gaming.enable = true;
  };

  my.desktop = {
    wms = ["niri"];
  };

  system.stateVersion = "26.05";
}
