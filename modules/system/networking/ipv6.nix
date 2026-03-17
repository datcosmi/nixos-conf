{...}: {
  networking.enableIPv6 = true;

  boot.kernel.sysctl = {
    "net.ipv6.conf.all.disable_ipv6" = 0;
    "net.ipv6.conf.default.disable_ipv6" = 0;
  };
}
