{...}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/jpg" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/*" = "org.gnome.Loupe.desktop";

      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";

      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };
}
