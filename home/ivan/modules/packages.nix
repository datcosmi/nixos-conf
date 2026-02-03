{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    brave
    spotify
    nautilus
    localsend
    ente-auth
    vlc
    ffmpeg

    protonvpn-gui
    proton-pass

    wiremix
    bluetui
    # overskride
    grim
    slurp
    wl-clipboard
    unzip
    loupe
    ristretto

    brightnessctl

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

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # fonts.fontconfig.enable = true;
}
