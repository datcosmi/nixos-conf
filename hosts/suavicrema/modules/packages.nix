{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    kitty
    tree
    stow
    tuigreet
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono

    noto-fonts-color-emoji
  ];

  nixpkgs.config.allowUnfree = true;
}
