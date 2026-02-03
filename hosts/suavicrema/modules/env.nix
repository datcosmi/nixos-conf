{ ... }:

{
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";

    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
    config.common.default = "gtk";
  };

  wayland.windowManager.hyprland.settings = {
    "$browser" = "zen";
  };

  # security.sudo.extraConfig = ''
  #   Defaults prompt="Password: "
  # '';
};
