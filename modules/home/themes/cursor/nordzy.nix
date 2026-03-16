{pkgs, ...}: let
  cfg = config.my.theme;
in
  with lib;
    mkIf (cfg.gtk == "nordzy")
    {
      home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        name = "Nordzy-cursors";
        package = pkgs.nordzy-cursor-theme;
        size = 24;
      };
    }
