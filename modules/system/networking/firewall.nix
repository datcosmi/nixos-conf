{...}: {
  networking.firewall = {
    enable = true;

    allowPing = true;
    checkReversePath = "loose";

    trustedInterfaces = [
      "enp5s0"
    ];
  };
}
