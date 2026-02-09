{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm-app waybar"
      # "uwsm-app -- swayosd-server"
      # "uwsm-app -- swaync"
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

      # Slow app launch fix -- set systemd vars
      "systemctl --user import-environment $(env | cut -d'=' -f 1)"
      "dbus-update-activation-environment --systemd --all"

      # Focus main monitor on boot
      "hyprctl dispatch workspace 1"

      # Cliphist
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      # Programs
      "uwsm-app -- protonvpn-app"
      "uwsm-app -- steam -silent"

      # Wallpaper (awww)
      "awww-daemon"
      "awww img ~/.local/share/themes/wallpapers/blue-landscape-cat.png --transition-type grow --transition-duration 1.2 --transition-fps 60"
    ];
  };
}
