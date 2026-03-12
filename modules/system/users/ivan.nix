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

  # system.activationScripts.nixProfileDirIvan = {
  #   text = ''
  #     mkdir -p /nix/var/nix/profiles/per-user/ivan
  #     chown ivan:users /nix/var/nix/profiles/per-user/ivan
  #     mkdir -p /nix/var/nix/gcroots/per-user/ivan
  #     chown ivan:users /nix/var/nix/gcroots/per-user/ivan
  #   '';
  #   deps = ["users"];
  # };

  # systemd.tmpfiles.rules = [
  #   "d /nix/var/nix/profiles/per-user/ivan 0755 ivan users -"
  # ];
}
