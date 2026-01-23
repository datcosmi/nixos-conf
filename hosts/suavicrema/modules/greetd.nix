{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd 'uwsm start hyprland' --remember --remember-user-session";
        user = "greeter";
      };
    };
  };
}
