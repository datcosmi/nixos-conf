{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "s";
    mouse = true;
    baseIndex = 1;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      resurrect
      continuum
    ];

    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set -g status-style bg=default
      set-option -g status-position top
    '';
  };
}
