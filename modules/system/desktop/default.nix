{lib, ...}:
with lib; {
  imports = [
    ./zen.nix
    ./gaming.nix
    ./fonts.nix

    ./wm
  ];

  options.my.wm = {
    niri = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to turn on or off niri";
    };

    hyprland = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to turn on or off hyprland";
    };
  };
}
