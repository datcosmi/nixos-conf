{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.theme;
in
  with lib;
    mkIf (cfg.gtk == "adwaita-dark")
    {
      gtk = {
        enable = true;

        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };

        iconTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };
      };

      dconf.settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        icon-theme = "Adwaita";
      };
    }
