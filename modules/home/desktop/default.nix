{lib, ...}:
with lib; {
  imports = [
    ./apps.nix
    ./default-apps.nix
    ./utils

    ./wm
  ];

  options.my.wm = {
    niri = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use niri with home manager or not";
    };

    hyprland = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to use hyprland with home manager or not";
    };
  };
}
