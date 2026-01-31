{
  config,
  pkgs,
  ...
}: let
  wallpaper = "$HOME/.local/share/themes/wallpapers/blue-landscape-cat.png";
in {
  home.packages = with pkgs; [
    swww
    socat
    jq
  ];

  systemd.user.services.hypr-monitor-fix = {
    Unit = {
      Description = "Hyprland monitor hotplug handler (swww + waybar)";
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = pkgs.writeShellScript "hypr-monitor-fix" ''
        # wait for hyprland
        until hyprctl monitors &>/dev/null; do
          sleep 1
        done

        # init swww once
        swww query || swww init

        # initial wallpaper
        swww img "${wallpaper}" --transition-type grow --transition-duration 1.2 --transition-fps 60

        # listen to Hyprland events
        socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | \
        while read -r line; do
          case "$line" in
            monitoradded*|monitorremoved*)
              swww img "${wallpaper}" --transition-type grow --transition-duration 1.2 --transition-fps 60
              pkill waybar && waybar &
              ;;
          esac
        done
      '';

      Restart = "always";
      RestartSec = 2;
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
