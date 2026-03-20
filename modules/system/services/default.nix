{...}: {
  imports = [
    ./core.nix

    ./printing.nix
    ./bluetooth.nix
    ./flatpak.nix
    ./keyring.nix
    ./polkit.nix
  ];
}
