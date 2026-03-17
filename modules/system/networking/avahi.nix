{...}: {
  services.avahi = {
    enable = true;
    nssmdns4and6 = true;
    openFirewall = true;

    publish = {
      enable = true;
      userServices = true;
    };
  };

  environment.systemPackages = with pkgs; [
    system-config-printer
  ];
}
