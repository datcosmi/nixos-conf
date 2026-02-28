{
  config,
  pkgs,
  lib,
  ...
}: let
  lockCmd = "${pkgs.swaylock-effects}/bin/swaylock -f --screenshots --clock --indicator --effect-blur 7x5";
in {
  home.packages = with pkgs; [
    swaylock
    swayidle
  ];

  services.swayidle = {
    enable = true;

    timeouts = [
      # Lock at 10 minutes
      {
        timeout = 600;
        command = lockCmd;
      }

      # Turn off displays at 15 minutes
      {
        timeout = 900;
        command = "niri msg action dpms off";
        resumeCommand = "niri msg action dpms on";
      }

      # Suspend at 20 minutes
      {
        timeout = 1200;
        command = "systemctl suspend";
      }
    ];

    events = [
      # Lock before sleep (important!)
      {
        event = "before-sleep";
        command = lockCmd;
      }
    ];
  };
}
