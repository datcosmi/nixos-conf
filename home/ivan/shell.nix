{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";

    shellAliases = {
      ll = "ls -l";
      la = "eza --icons=always -a";
      ls = "eza --icons=always";
      cd = "z";
      inv = "nvim $(fzf -m --preview='bat --color=always {}')";
      shell = "source ~/.zshrc";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dirhistory"
        "history"
        "sudo"
        "ssh-agent"
      ];
      theme = "robbyrussell";
    };

    initContent = ''
      if [[ -o interactive ]]; then
        clear
        fastfetch
      fi
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "garcia.cli@pm.me";
        name = "Iván García";
      };
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zoxide.enable = true;
  programs.starship.enable = true;
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fzf.enable = true;
  programs.lazygit.enable = true;

  programs.bash = {
    enable = true;
  };
}
