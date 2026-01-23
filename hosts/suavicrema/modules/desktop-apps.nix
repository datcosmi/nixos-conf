{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    # extraCompatPackages = with pkgs; [
    #   proton-experimental-bin
    # ];
  };
}
