{
  config,
  lib,
  osConfig,
  ...
}: let
  hostType = osConfig.my.hardware.host;
  cfg = osConfig.my.features.desktop.niri;
in {
  imports = [
    ./lock.nix
  ];

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".text = lib.concatStringsSep "\n" [
      (builtins.readFile ./base.kdl)
      (builtins.readFile (./monitors + "/${hostType}.kdl"))
      (builtins.readFile (./inputs + "/${hostType}.kdl"))
    ];
  };
}
