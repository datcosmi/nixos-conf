{pkgs, ...}: {
  programs.discord = {
    enable = true;
    # package = pkgs.discord-canary;
  };

  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf.override {
      extraPrefs = ''
        lockPref("privacy.clearHistory.cache", false);
        lockPref("privacy.clearHistory.cookiesAndStorage", false);
        lockPref("privacy.clearHistory.browsingHistoryAndDownloads", false);
      '';
    };

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        "cookiebanners.service.mode.privateBrowsing" = 2;
        "cookiebanners.service.mode" = 2;
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };
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
}
