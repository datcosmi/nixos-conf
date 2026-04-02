{pkgs, ...}: {
  programs.discord = {
    enable = true;
    # package = pkgs.discord-canary;
  };

  programs.librewolf = {
    enable = true;

    settings = {
      # Do NOT clear cookies or sessions on shutdown
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.sessions" = true;
      "privacy.clearOnShutdown.cache" = true;
      "privacy.clearOnShutdown.history" = false;

      # Allow persistent cookies
      "network.cookie.lifetimePolicy" = 0;

      # Disable permanent private browsing
      "browser.privatebrowsing.autostart" = false;

      # Reasonable tracking protection
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.pbmode.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;

      # Keep history
      "places.history.enabled" = true;

      "privacy.resistFingerprinting" = true;
      "privacy.resistFingerprinting.letterboxing" = false;
      "privacy.reduceTimerPrecision" = false;
    };

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      ExtensionSettings = {
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
        };
        "{47bf427e-c83d-457d-9b3d-3db4118574bd}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nighttab/latest.xpi";
        };
      };
    };
  };

  programs.zathura = {
    enable = true;
  };

  programs.obsidian = {
    enable = true;
  };

  home.packages = with pkgs; [
    spotify
    tidal-hifi
    vivaldi
    nautilus
    localsend
    ente-auth
    vlc

    proton-vpn
    proton-pass

    qbittorrent
  ];
}
