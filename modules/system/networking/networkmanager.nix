{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.features.system.networkManager;
in {
  options.my.features.system.networkManager.enable =
    lib.mkEnableOption "networkManager";

  config = lib.mkIf cfg.enable {
    networking.networkmanager = {
      enable = true;
    };

    systemd.services.NetworkManager-wait-online.enable = false;

    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
  };
}
