{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./rofi.nix
    ./fastfetch.nix
    ./starship.nix
    ./wleave.nix
    ./lock.nix
    ./clipboard.nix
  ];

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      proc_sorting = "memory";
      theme_background = false;
    };
  };

  programs.waybar = {
    enable = true;
    # systemd.enable = true;
    # systemd.target = "niri.service";
    # settings.mainBar.layer = "top";
  };

  programs.yazi = {
    enable = true;
  };

  services.swaync = {
    enable = true;
  };

  services.swayosd = {
    enable = true;
  };

  home.packages = with pkgs; [
    wiremix
    bluetui
    unzip
    rofimoji

    loupe

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}
