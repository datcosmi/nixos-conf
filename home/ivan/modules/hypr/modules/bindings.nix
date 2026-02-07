{config, ...}: {
  imports = [
    ./bindings/tiling.nix
    ./bindings/utilities.nix
  ];

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    "$terminal" = "kitty";
    "$TUI" = "ghostty";
    "$fileManager" = "nautilus";
    "$menu" = "wofi --show drun";
    "$browser" = "zen";

    bindd = [
      "$mainMod, RETURN, Open terminal, exec, $terminal"
      "$mainMod SHIFT, RETURN, Open tmux directly,  exec, $terminal -e tmux"
      "$mainMod, W, Close window, killactive,"
      # "$mainMod, M, Kill session, exit,"
      "$mainMod SHIFT, F, Open file manager, exec, $fileManager"
      "$mainMod SHIFT, B, Open browser, exec, $browser"
      "$mainMod SHIFT, Y, Open yazi file manager, exec, $terminal --class yazi -e yazi"
      "$mainMod SHIFT, D, Open discord, exec, flatpak run com.discordapp.Discord"
      "$mainMod SHIFT, G, Open steam, exec, steam"
      "$mainMod SHIFT, M, Open spotify, exec, spotify"
      "$mainMod SHIFT, W, Open whatsapp, exec, gtk-launch whatsapp"
      "$mainMod SHIFT, E, Open mail, exec, gtk-launch protonmail"
      "$mainMod SHIFT, A, Open authenticator, exec, enteauth"
      "$mainMod SHIFT, P, Open password manager, exec, proton-pass"
      "$mainMod SHIFT, K, Open bakkesmod, exec, protontricks-launch --appid 252950 '/home/ivan/.steam/steam/steamapps/compatdata/252950/pfx/drive_c/Program Files/BakkesMod/BakkesMod.exe'"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
