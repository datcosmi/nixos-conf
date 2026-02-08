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
    stow
    tuigreet

    system-config-printer
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono

    noto-fonts-color-emoji
  ];

  nixpkgs.config.allowUnfree = true;

  # programs.nix-ld.enable = true;
  # fonts.fontDir.enable = true;
  # fonts.enableDefaultPackages = true;
}
