{
  config,
  pkgs,
  lib,
  ...
}: let
  lockCmd = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --indicator --effect-blur 7x5";
  cfg = config.my.wm;
in {
  config = lib.mkIf cfg.niri {
    home.packages = with pkgs; [
      # swaylock-effects
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
          command = "${pkgs.hyprlock}/bin/hyprlock && systemctl suspend";
        }
      ];

      events = {
        before-sleep = "${pkgs.hyprlock}/bin/hyprlock";
      };
    };
  };
}
