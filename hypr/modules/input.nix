{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "altgr-intl";
      kb_options = "caps:capslock";

      repeat_rate = 50;
      repeat_delay = 330;

      numlock_by_default = false;

      sensitivity = "-0.5";
      follow_mouse = 1;
    };

    misc = {
      key_press_enables_dpms = true;
      mouse_move_enables_dpms = true;
    };
  };
}
