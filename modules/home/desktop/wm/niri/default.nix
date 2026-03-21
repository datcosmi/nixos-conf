{
  config,
  lib,
  osConfig,
  ...
}: let
  hostType = osConfig.my.hardware.host;
in {
  imports = [
    ./lock.nix
  ];

  xdg.configFile."niri/config.kdl".text = lib.concatStringsSep "\n" [
    (builtins.readFile ./base.kdl)
    (builtins.readFile (./monitors + "/${hostType}.kdl"))
    (builtins.readFile (./inputs + "/${hostType}.kdl"))
  ];
}
