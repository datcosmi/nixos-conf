{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    kitty
    stow
    tuigreet

    system-config-printer

    cabextract
    xrandr
    vulkan-tools

    # btrfs-progs
    # lvm2
    # cryptsetup
    # pciutils
    # usbutils
    networkmanagerapplet
    nvtopPackages.nvidia
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.commit-mono

    noto-fonts
    noto-fonts-color-emoji
  ];

  nixpkgs.config.allowUnfree = true;

  # programs.nix-ld.enable = true;
  # fonts.fontDir.enable = true;
  # fonts.enableDefaultPackages = true;
}
