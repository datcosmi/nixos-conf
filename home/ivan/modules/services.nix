{ pkgs, ... }:

{
  services.swaync = {
    enable = true;
  };

  services.swayosd = {
    enable = true;
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
    clipboardPackage = pkgs.wl-clipboard;
  };
}
