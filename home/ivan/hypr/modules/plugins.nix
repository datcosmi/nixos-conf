{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    plugin = {
      hyprscrolling = {
        column_width = "0.7";
        fullscreen_on_one_column = true;
        follow_focus = true;
        focus_fit_method = 1;
        explicit_column_widths = "0.5,0.7,0.8,1.0";
      };
    };
  };
}
