{pkgs, ...}: {
  programs.wleave = {
    enable = true;

    settings = {
      margin = 200;
      buttons-per-row = "5";
      delay-command-ms = 100;
      close-on-lost-focus = true;
      buttons = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Sleep";
          keybind = "u";
        }
      ];
    };
  };
}
