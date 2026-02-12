{pkgs, ...}: {
  programs.discord = {
    enable = true;
    # package = pkgs.discord-canary;
  };

  programs.librewolf = {
    enable = true;
  };
}
