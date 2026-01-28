{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    brave
    spotify
    discord
    nautilus
    localsend
    ente-auth

    protonvpn-gui
    proton-pass

    wiremix
    grim
    slurp
    wl-clipboard

    # protontricks
    # protonup-ng
    # winetricks

    nodejs_24
    alejandra

    brightnessctl

    inputs.swww.packages.${pkgs.stdenv.hostPlatform.system}.swww
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
