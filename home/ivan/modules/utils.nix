{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./utils/tmux.nix
    ./utils/rofi.nix
    ./utils/fastfetch.nix
    ./utils/starship.nix
    ./utils/wleave.nix
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
  };

  programs.yazi = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fd = {
    enable = true;
  };

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

  home.packages = with pkgs; [
    wiremix
    bluetui
    grim
    slurp
    wl-clipboard
    unzip
    rofimoji

    loupe

    protontricks

    # brightnessctl

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
