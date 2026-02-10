{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      # Cursor size
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"

      # Force all apps to use Wayland
      "GDK_BACKEND,wayland,x11,*"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_STYLE_OVERRIDE,kvantum"
      "SDL_VIDEODRIVER,wayland"
      "MOZ_ENABLE_WAYLAND,1"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      "OZONE_PLATFORM,wayland"
      "XDG_SESSION_TYPE,wayland"

      # Allow better support for screen sharing (Google Meet, Discord, etc)
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"

      # Use XCompose file
      "XCOMPOSEFILE,~/.XCompose"

      "HYPRCURSOR_THEME,rose-pine-hyprcursor"

      # NVIDIA environment variables
      "NVD_BACKEND,direct"
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "GBM_BACKEND,nvidia-drm"
      "WLR_NO_HARDWARE_CURSORS,1"

      # Cursor
      "HYPRCURSOR_THEME,rose-pine-hyprcursor"

      # Keyrings
      "SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/keyring/ssh"

      # QT Apps dark theme
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "QT_QPA_PLATFORM,wayland"

      # Monitors
      "GDK_SCALE,1"

      # Style Gum confirm to match terminal theme
      "GUM_CONFIRM_PROMPT_FOREGROUND,6" # Cyan
      "GUM_CONFIRM_SELECTED_FOREGROUND,0" # Black
      "GUM_CONFIRM_SELECTED_BACKGROUND,2" # Green
      "GUM_CONFIRM_UNSELECTED_FOREGROUND,0" # Black
      "GUM_CONFIRM_UNSELECTED_BACKGROUND,8" # Dark grey
    ];

    xwayland = {
      force_zero_scaling = true;
    };

    # Don't show update on first launch
    ecosystem = {
      no_update_news = true;
    };
  };
}
