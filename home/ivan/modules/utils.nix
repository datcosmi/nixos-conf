{ pkgs, ... }:

{
  programs.wleave = {
    enable = true;
  };

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

  programs.fastfetch = {
    enable = true;
  };
}
