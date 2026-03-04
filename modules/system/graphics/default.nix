{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./nvidia.nix
  ];

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "gtk";
  };
}
