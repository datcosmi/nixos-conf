{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.theme;
in
  with lib;
    mkIf (cfg.gtk == "bibata-modern")
    {
      home.pointerCursor = {
        gtk.enable = true;
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 17;
      };
    }
