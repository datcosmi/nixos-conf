{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    kitty
    stow
    tuigreet
    networkmanagerapplet
    system-config-printer
    cachix
    exfatprogs

    # cabextract
    # xrandr
    # vulkan-tools

    # nvtopPackages.nvidia
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono

    noto-fonts
    noto-fonts-color-emoji
  ];

  nixpkgs.config.allowUnfree = true;
}
