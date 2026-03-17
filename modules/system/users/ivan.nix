{pkgs, ...}: {
  users.users.ivan = {
    isNormalUser = true;
    description = "Ivan";
    shell = pkgs.zsh;

    home = "/home/ivan";
    createHome = true;

    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
      "networkmanager"
      "bluetooth"
    ];
  };
}
