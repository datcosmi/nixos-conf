{...}: {
  imports = [
    ./networkmanager.nix
    ./dns.nix
    ./avahi.nix
    ./firewall.nix
    ./ipv6.nix
  ];
}
