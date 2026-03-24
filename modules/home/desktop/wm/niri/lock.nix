{
  pkgs,
  lib,
  osConfig,
  ...
}: let
  lockCmd = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --indicator --effect-blur 7x5";
in {
  config = lib.mkIf osConfig.my.features.desktop.niri.enable {
    home.packages = with pkgs; [
      hyprlock
      swayidle
    ];
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 600;
          command = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 900;
          command = "niri msg action dpms off";
          resumeCommand = "niri msg action dpms on";
        }
        {
          timeout = 1200;
          command = "systemctl suspend";
        }
      ];
      events = {
        before-sleep = "${pkgs.hyprlock}/bin/hyprlock";
      };
    };
  };
}
