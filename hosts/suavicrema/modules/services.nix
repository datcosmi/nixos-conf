{ pkgs, ... }:

{
  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.printing.enable = true;

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.dbus.packages = [
    pkgs.gnome-keyring
    pkgs.gcr
  ];

  security.pam.services = {
    # sddm.enableGnomeKeyring = true;
    # sddm-greeter.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  programs.seahorse.enable = true;

  system.stateVersion = "16.05";
}
