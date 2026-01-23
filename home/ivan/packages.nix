{ pkgs, inputs, ... }:

{
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

    nodejs_24

    inputs.swww.packages.${pkgs.stdenv.hostPlatform.system}.swww
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
