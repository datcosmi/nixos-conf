{pkgs, ...}: {
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.dbus = {
    enable = true;
    implementation = "broker";

    packages = [
      pkgs.gnome-keyring
      pkgs.gcr
      pkgs.dconf
    ];
  };

  services.upower.enable = true;

  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  programs.seahorse.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  services.flatpak.enable = true;

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  # services.udev.extraRules = ''
  #   ACTION=="add|change", KERNEL=="sda", ATTR{queue/rotational}=="0", \
  #     ATTR{queue/scheduler}="mq-deadline"
  # '';
}
