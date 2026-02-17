{
  pkgs,
  inputs,
  ...
}: {
  catppuccin.bat = {
    enable = true;
    flavor = "mocha";
  };

  catppuccin.lazygit = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  catppuccin.fzf = {
    enable = true;
    flavor = "mocha";
  };

  catppuccin.eza = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  catppuccin.wleave = {
    enable = true;
    flavor = "mocha";
    iconStyle = "wleave";
  };

  catppuccin.btop = {
    enable = true;
    flavor = "mocha";
  };

  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  catppuccin.kitty = {
    enable = true;
    flavor = "mocha";
  };

  catppuccin.ghostty = {
    enable = true;
    flavor = "mocha";
  };

  catppuccin.swaync = {
    enable = true;
    flavor = "mocha";
    font = "CommitMono Nerd Font";
  };

  catppuccin.librewolf = {
    enable = true;
    flavor = "mocha";
    accent = "pink";
  };

  catppuccin.tmux = {
    enable = true;
    flavor = "mocha";
    extraConfig = ''
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -g @catppuccin_window_default_text " #W"
      set -g @catppuccin_window_current_text " #W"
      set -g @catppuccin_window_text " #W"
    '';
  };

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    icon-theme = "Adwaita";
  };
}
