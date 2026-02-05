{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # uwsm-app -- hypridle
      # uwsm-app -- mako
      "uwsm-app -- waybar"
      # uwsm-app -- fcitx5
      # uwsm-app -- swaybg -i ~/.local/share/themes/wallpapers/hypr-bg.png -m fill
      # uwsm-app -- hyprpaper
      "uwsm-app -- swayosd-server"
      "uwsm-app -- swaync"
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

      # Slow app launch fix -- set systemd vars
      "systemctl --user import-environment $(env | cut -d'=' -f 1)"
      "dbus-update-activation-environment --systemd --all"

      # Focus main monitor on boot
      "exec-once=hyprctl dispatch workspace 1"

      # Cliphist
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      # Programs
      "protonvpn-app"
      "steam -silent"

      # Wallpaper (awww)
      "awww-daemon"
      "awww img ~/.local/share/themes/wallpapers/blue-landscape-cat.png --transition-type grow --transition-duration 1.2 --transition-fps 60"

      # Keyring
      # gnome-keyring-daemon --start --components=secrets,ssh

      # Dark theme
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
      "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
    ];
  };
}
