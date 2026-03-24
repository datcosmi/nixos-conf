{
  lib,
  config,
  ...
}:
with lib; {
  options.my.theme = {
    palette = mkOption {
      type = types.enum ["catppuccin-mocha"];
      default = "catppuccin-mocha";
    };

    gtk = mkOption {
      type = types.enum ["adwaita-dark"];
      default = "adwaita-dark";
    };

    cursor = mkOption {
      type = types.enum ["bibata-modern" "nordzy"];
      default = "bibata-modern";
    };

    wallpaper = mkOption {
      type = types.path;
    };

    colors = mkOption {
      type = types.attrsOf types.str;
      default = {};
    };
  };

  imports = [
    ./palettes
    ./gtk
    ./cursor
    ./apps
  ];
}
