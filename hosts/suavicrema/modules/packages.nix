{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    kitty
    tree
    stow
    tuigreet

    corefonts
    vista-fonts
    freetype
    fontconfig
    winetricks

    system-config-printer
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono

    noto-fonts-color-emoji

    corefonts
    vista-fonts
    liberation_ttf
    dejavu_fonts
    freefont_ttf
  ];

  nixpkgs.config.allowUnfree = true;
}
