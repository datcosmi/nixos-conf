{pkgs, ...}: {
  imports = [
    ./tmux.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    # LSP's
    lua-language-server
    rust-analyzer
    tailwindcss-language-server
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.svelte-language-server
    pyright
    astro-language-server

    # Formatters
    stylua
    isort
    black
    rustc
    prettierd
    nodePackages.prettier
    alejandra
    kdlfmt
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  services.gpg-agent.enable = true;
}
