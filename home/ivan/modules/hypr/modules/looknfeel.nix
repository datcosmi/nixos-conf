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

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      rounding_power = 20;

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

    env = [
      # Style Gum confirm to match terminal theme
      "GUM_CONFIRM_PROMPT_FOREGROUND,6" # Cyan
      "GUM_CONFIRM_SELECTED_FOREGROUND,0" # Black
      "GUM_CONFIRM_SELECTED_BACKGROUND,2" # Green
      "GUM_CONFIRM_UNSELECTED_FOREGROUND,0" # Black
      "GUM_CONFIRM_UNSELECTED_BACKGROUND,8" # Dark grey
    ];

    windowrule = "opacity 0.9 0.83, match:class .*";
  };
}
