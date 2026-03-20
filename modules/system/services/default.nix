{...}: {
  imports = [
    ./core.nix

    ./printing.nix
    ./bluetooth.nix
    ./flatpak.nix
    ./avahi.nix
    ./keyring.nix
    ./polkit-agent.nix
  ];
}
