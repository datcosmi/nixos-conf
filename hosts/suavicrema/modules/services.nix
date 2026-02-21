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

  services.gnome.gnome-keyring.enable = true;

  services.dbus = {
    enable = true;
    implementation = "broker";

    packages = [
      pkgs.gnome-keyring
      pkgs.gcr
    ];
  };

  security.pam.services = {
    # sddm.enableGnomeKeyring = true;
    # sddm-greeter.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  programs.seahorse.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.flatpak.enable = true;

  services.fstrim.enable = true;
}
