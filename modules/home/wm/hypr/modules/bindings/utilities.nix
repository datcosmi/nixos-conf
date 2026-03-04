{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Toggle control center
      "$mainMod SHIFT, N, exec, swaync-client -t -sw"

      # Rofi
      "$mainMod, SPACE, exec, rofi -show drun"
      # bindd = $mainMod CTRL, E, Rofi emoji selector, exec, rofi -show emoji
      "$mainMod CTRL, E, exec, rofimoji"
      "$mainMod CTRL, C, exec, rofi -show calc -modi calc -no-show-match -no-sort"
      "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

      # Hypremoji
      # "$mainMod CTRL, E, exec, hypremoji"

      # Reload waybar
      "$mainMod SHIFT, SPACE, exec, pkill waybar && uwsm-app waybar"

      # Reload Proton VPN tray icon
      "$mainMod CTRL, SPACE, exec, pkill -USR1 protonvpn && uwsm-app -- protonvpn-app"

      # Screenshot of a region
      ", Print, exec, grim -g \"$(slurp)\" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send 'Screenshot of the region taken' -t 1000"

      # Screenshot of the whole screen
      "SHIFT, Print, exec, grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send 'Screenshot of whole screen taken' -t 1000"

      # Change audio output
      "$mainMod, Q, exec, toggle-audio-output Sinks"
      "$mainMod SHIFT, Q, exec, toggle-audio-output Sources"

      "$mainMod, T, togglefloating,"
      "$mainMod, P, pseudo, # dwindle"
      "$mainMod, J, togglesplit, # dwindle"
      "$mainMod, ESCAPE, exec, wleave"

      # TUIs
      "$mainMod SHIFT, T, exec, $terminal --class btop -e btop"
      "$mainMod SHIFT, S, exec, $terminal --class wiremix -e wiremix"
      "$mainMod SHIFT, E, exec, $terminal --class bluetui -e bluetui"

      # SwayNC
      "$mainMod CTRL, D, exec, swaync-client -d"
    ];
  };
}
