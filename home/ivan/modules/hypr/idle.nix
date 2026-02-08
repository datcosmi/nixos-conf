{pkgs, ...}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "hyprlock";
        before_sleep_cmd = "hyprlock";
        # after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 600;
          on-timeout = "hyprlock";
        }
        # {
        #   timeout = 330;
        #   on-timeout = "hyprctl dispatch dpms off";
        #   on-resume  = "hyprctl dispatch dpms on && ${pkgs.brightnessctl}/bin/brightnessctl -r";
        # }
        {
          timeout = 1200;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
