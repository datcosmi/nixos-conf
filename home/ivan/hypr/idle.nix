{
  config,
  pkgs,
  ...
}: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session && sleep 1";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };

      listener = [
        # Lock screen after 10 minutes
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }

        # Turn off displays after 15 minutes
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        # Suspend after 20 minutes
        {
          timeout = 1200;
          on-timeout = "pidof hyprlock && systemctl suspend";
        }
      ];
    };
  };
}
