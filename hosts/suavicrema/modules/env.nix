{ ... }:

{
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";

    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  wayland.windowManager.hyprland.settings = {
    "$browser" = "zen";
  };

  # security.sudo.extraConfig = ''
  #   Defaults prompt="Password: "
  # '';
};
