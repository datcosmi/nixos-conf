{lib, ...}:
with lib; {
  imports = [
    ./apps.nix
    ./default-apps.nix
    ./utils

    ./wm
  ];

  options.my.desktop = {
    wms = lib.mkOption {
      type = lib.types.listOf (lib.types.enum ["niri" "hyprland"]);
      default = [];
      description = "Window managers to enable on home manager";
    };
  };
}
