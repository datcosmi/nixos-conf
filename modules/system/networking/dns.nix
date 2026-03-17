{...}: {
  services.resolved = {
    enable = true;
    dnssec = "false";
    domains = ["~."];
    fallbackDns = [
      "9.9.9.11"
      "149.112.112.11"
    ];
  };

  networking.nameservers = ["127.0.0.53"];
}
