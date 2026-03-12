{...}: {
  imports = [
    ../../profiles/laptop.nix
    ./hardware-configuration.nix
    ./disko.nix
    ../../modules/system/users/ivan.nix
  ];

  networking.hostName = "mandarina";

  my.hardware = {
    gpu = "nvidia";
    # hybrid = true;
    #
    # prime.intelBusId = "PCI:0:2:0";
    # prime.nvidiaBusId = "PCI:1:0:0";
  };

  system.stateVersion = "26.05";
}
