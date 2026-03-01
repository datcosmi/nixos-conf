{ ... }:

{
  networking = {
    hostName = "suavicrema";
    networkmanager.enable = true;
    enableIPv6 = true;

    firewall = {
      enable = true;
      allowPing = true;
      checkReversePath = false;
      trustedInterfaces = [ "enp5s0" ];
    };
  };

  boot.kernel.sysctl = {
    "net.ipv6.conf.all.disable_ipv6" = 0;
    "net.ipv6.conf.default.disable_ipv6" = 0;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
