{pkgs, ...}: {
  users.users.ivan = {
    isNormalUser = true;
    description = "Ivan";
    shell = pkgs.zsh;
    extraGroups = ["wheel" "video" "audio" "input" "networkmanager" "bluetooth"];
  };

  systemd.tmpfiles.rules = [
    "d /nix/var/nix/profiles/per-user/ivan 0755 ivan users -"
  ];
}
