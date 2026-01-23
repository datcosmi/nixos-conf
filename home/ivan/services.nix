{ pkgs, ... }:

{
  services.swaync = {
    enable = true;
  };

  services.swayosd = {
    enable = true;
  };
}
