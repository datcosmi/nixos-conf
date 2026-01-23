{ pkgs, ... }:

{
  users.users.ivan = {
    isNormalUser = true;
    description = "Ivan";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
