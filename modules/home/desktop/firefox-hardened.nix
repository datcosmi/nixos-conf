{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableAccounts = true;
      DisableFormHistory = false;

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      DNSOverHTTPS = {
        Enabled = false;
      };

      Cookies = {
        Behavior = "reject-tracker-and-partition-foreign";
      };

      DontCheckDefaultBrowser = true;
    };

    profiles.default = {
      id = 0;
      name = "default";

      settings = {
        # Core privacy
        "privacy.resistFingerprinting" = true;
        "privacy.firstparty.isolate" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;

        "network.cookie.cookieBehavior" = 5;

        # Telemetry disabled
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";
        "datareporting.healthreport.uploadEnabled" = false;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;

        # WebRTC leak protection
        "media.peerconnection.enabled" = false;

        # Safe browsing
        "browser.safebrowsing.enabled" = true;
        "browser.safebrowsing.malware.enabled" = true;

        # DRM
        "media.eme.enabled" = true;
        "media.gmp-widevinecdm.enabled" = true;

        # Session persistence
        "browser.sessionstore.resume_from_crash" = false;

        # Fingerprinting trade-offs
        # Keep timezone spoofing etc.
        "privacy.resistFingerprinting.pbmode" = true;

        # WebGL
        "webgl.disabled" = false;

        # Misc hardening
        "beacon.enabled" = false;
        "browser.send_pings" = false;
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;

        # UI sanity
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.topsites" = false;
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        privacy-badger
        clearurls
      ];
    };
  };

  # Ensure Widevine works
  environment.systemPackages = with pkgs; [
    firefox
  ];
}
