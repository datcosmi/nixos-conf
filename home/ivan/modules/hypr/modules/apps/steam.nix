{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
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
