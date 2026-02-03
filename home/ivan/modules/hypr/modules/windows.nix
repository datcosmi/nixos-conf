{config, ...}: {
  wayland.windowManager.hyprland.settings = {
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

      # GNOME / utility dialogs
      "float on, center on, size 1280 800, match:class ^(org.gnome.Loupe|org.gnome.NautilusPreviewer|org.gnome.Nautilus|virt-manager|system-config-printer|Proton Pass)$"

      # Bind apps to workspaces
      "workspace 3, match:class zen"
      "workspace 2, match:class ^(discord|com.discordapp.Discord|spotify)$"
      "workspace 1, match:class kitty"
      "workspace 5, match:class steam"
    ];
  };
}
