{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    videoAcceleration = true;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [
    #   pkgs.xdg-desktop-portal-gtk
    #   pkgs.xdg-desktop-portal-hyprland
    # ];
    config.common.default = "gtk";
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
}
