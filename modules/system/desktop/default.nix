{lib, ...}:
with lib; {
  imports = [
    ./zen.nix
    ./gaming.nix
    ./fonts.nix

    ./wm
  ];

  options.my.desktop = {
    wms = lib.mkOption {
      type = lib.types.listOf (lib.types.enum ["niri" "hyprland"]);
      default = [];
      description = "Window managers to enable on the system";
    };
  };
}
