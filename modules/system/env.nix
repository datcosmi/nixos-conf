{
  config,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    # XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;
}
