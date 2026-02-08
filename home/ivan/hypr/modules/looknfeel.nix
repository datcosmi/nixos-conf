{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    # Variables
    "$activeBorderColor" = "rgb(ffbae5) rgb(cabaff) 45deg";
    "$inactiveBorderColor" = "rgba(595959aa)";

    general = {
      gaps_in = 6;
      gaps_out = 11;
      border_size = 2;

      "col.active_border" = "$activeBorderColor";
      "col.inactive_border" = "$inactiveBorderColor";

      layout = "scrolling";
    };

    decoration = {
      rounding = 13;
      rounding_power = 13;

      shadow = {
        enabled = true;
        range = 25;
        render_power = 3;
        color = "rgba(1a1b2699)";
      };

      blur = {
        enabled = true;

        size = 10;
        passes = 3;

        noise = "0.01";
        contrast = "0.8";
        vibrancy = "0.2";

        xray = true;
      };

      dim_inactive = false;
    };

    group = {
      "col.border_active" = "$activeBorderColor";
      "col.border_inactive" = "$inactiveBorderColor";
      "col.border_locked_active" = "-1";
      "col.border_locked_inactive" = "-1";

      groupbar = {
        font_size = 12;
        font_family = "monospace";
        font_weight_active = "ultraheavy";
        font_weight_inactive = "normal";

        indicator_height = 0;
        indicator_gap = 5;
        height = 22;
        gaps_in = 5;
        gaps_out = 0;

        text_color = "rgb(ffffff)";
        text_color_inactive = "rgba(ffffff90)";
        "col.active" = "rgba(00000040)";
        "col.inactive" = "rgba(00000020)";

        gradients = true;
        gradient_rounding = 0;
        gradient_round_only_edges = false;
      };
    };

    animations = {
      enabled = true;

      # Bezier curves
      bezier = [
        "smoothOut, 0.36, 0, 0.66, -0.56"
        "smoothIn, 0.25, 1, 0.5, 1"
        "overshot, 0.05, 0.9, 0.1, 1.05"
        "softSnap, 0.4, 0, 0.2, 1"
        "fluent, 0.0, 0.0, 0.2, 1.0"
      ];

      animation = [
        # Windows
        "windows, 1, 5, overshot, popin 80%"
        "windowsIn, 1, 5, overshot, popin 80%"
        "windowsOut, 1, 4, smoothOut, popin 95%"
        "windowsMove, 1, 4, softSnap"

        # Layers
        "layersIn, 1, 3, smoothIn, slide right"
        "layersOut, 1, 2, softSnap, slide right"

        # Fade
        "fade, 1, 4, smoothIn"
        "fadeIn, 1, 4, smoothIn"
        "fadeOut, 1, 4, smoothOut"
        "fadeSwitch, 1, 4, smoothIn"
        "fadeShadow, 1, 4, smoothIn"
        "fadeDim, 1, 4, smoothIn"
        "fadeDpms, 1, 4, smoothIn"

        # Workspaces
        "workspaces, 1, 5, overshot, slidefade 30%"
        "specialWorkspace, 1, 5, overshot, slidefadevert 30%"
      ];
    };

    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true;
      force_split = 2; # Always split on the right
    };

    master = {
      new_status = "master";
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      focus_on_activate = true;
      anr_missed_pings = 3;
      # new_window_takes_over_fullscreen = 1
    };

    cursor = {
      hide_on_key_press = true;
    };

    windowrule = [
      # Ignore maximize requests from apps
      "suppress_event maximize, match:class .*"

      # Fix some dragging issues with XWayland
      "no_initial_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"

      # Simple floating windows
      "float on, match:class ^(nvidia-settings)$"

      # TUIs
      "float on, center on, size 1280 800, match:class ^(btop|wiremix|yazi|bluetui)$"

      # Kitty
      "float on, center on, size 1500 860, match:class ^(kitty)$"
      # "pseudo on, center on, match:class ^(kitty)$"
      # "max_size 1500 860, min_size 300 150, match:class ^(kitty)$"

      # GNOME / utility dialogs
      "pseudo on, size 1280 800, match:class ^(org.gnome.Loupe|org.gnome.NautilusPreviewer|org.gnome.Nautilus|virt-manager|system-config-printer|Proton Pass)$"
      # "float on, center on, size 1280 800, match:class ^(org.gnome.Loupe|org.gnome.NautilusPreviewer|org.gnome.Nautilus|virt-manager|system-config-printer|Proton Pass)$"

      # Bind apps to workspaces
      "workspace 3, match:class zen"
      "workspace 2, match:class ^(discord|com.discordapp.Discord|spotify)$"
      # "workspace 1, match:class kitty"
      "workspace 5, match:class steam"

      # BROWSER TWEAKS

      # Default opacity
      "match:class negative:((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium|[fF]irefox|zen|librewolf), opacity 0.9 0.83"

      # Browser types
      "match:class ((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium), tag +chromium-based-browser"
      "match:class ([fF]irefox|zen|librewolf), tag +firefox-based-browser"

      # Only a subtle opacity change, but not for video sites
      "match:tag chromium-based-browser, opacity 1 0.97"
      "match:tag firefox-based-browser, opacity 1 0.97"

      # Some video sites should never have opacity applied to them
      "match:title ((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home), opacity 1 1"

      # Force chromium-based browsers into a tile to deal with --app bug
      "tile on, match:tag chromium-based-browser"

      # Float and center Zen Browser history tab
      "float on, match:class zen, match:title Library"
      "center on, match:class zen, match:title Library"

      # STEAM TWEAKS

      # Float Steam
      "float on, match:class steam"
      "center on, match:class steam, match:title Steam"
      "opacity 1 1, match:class steam"

      "size 1380 800, match:class steam, match:title Steam"
      "size 460 800, match:class steam, match:title Friends List"

      # Prevent idle when Steam is fullscreen
      "match:class ^(steam)$, idle_inhibit always"
    ];
  };
}
