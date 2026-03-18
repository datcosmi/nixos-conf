{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1,1920x1080@165,1920x0,1,cm,auto,bitdepth,8"
      "HDMI-A-1,1920x1080@60,0x0,1,cm,auto,bitdepth,8"
    ];

    workspace = [
      "1,monitor:DP-1"
      "2,monitor:HDMI-A-1"
      "3,monitor:DP-1"
      "4,monitor:DP-1"
      "5,monitor:DP-1"
      "6,monitor:HDMI-A-1"
    ];
  };
}
