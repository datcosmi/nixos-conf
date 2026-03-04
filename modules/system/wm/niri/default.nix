{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
in {
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${system}.niri;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
