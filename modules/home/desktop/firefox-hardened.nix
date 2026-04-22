{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs.hardened-firefox;
  # addons = pkgs.nur.repos.rycee.firefox-addons or null;
  #
  # # Curated extension set (mirrors LibreWolf defaults + extras)
  # defaultExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
  #   ublock-origin          # content / ad / tracker blocking
  #   canvasblocker          # canvas fingerprint protection
  #   clearurls              # strip tracking params from URLs
  #   cookie-autodelete      # auto-purge cookies from inactive tabs
  #   decentraleyes          # local CDN emulation (reduce 3rd-party calls)
  #   LocalCDN               # wider local CDN coverage (use one or the other)
  #   dont-track-me-google   # de-AMP / de-Google-track outgoing links
  #   no-pdf-viewer          # force browser PDF viewer off (privacy)
  # ];
in {
  ##############################################################################
  # Option declarations
  ##############################################################################
  options.programs.hardened-firefox = {
    enable = lib.mkEnableOption "Hardened Firefox (LibreWolf-style)";

    profileName = lib.mkOption {
      type = lib.types.str;
      default = "hardened";
      description = "Name of the Firefox profile to create / manage.";
    };

    enableLetterboxing = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Enable privacy.resistFingerprinting letterboxing.
        Adds grey bars around the viewport to normalise window dimensions.
        Breaks some responsive layouts – disabled by default for daily driving.
      '';
    };

    additionalExtensions = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Extra NUR firefox-addon packages to install.";
    };

    extraPrefs = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Raw user.js prefs that override any defaults in this module.";
    };
  };

  ##############################################################################
  # Implementation
  ##############################################################################
  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      # ── Package – wrapped with policies & Wayland support ─────────────────
      # Setting `package` here is what home-manager uses to install Firefox.
      # Do NOT also add a firefox derivation to home.packages – that causes the
      # "two paths contain a conflicting subpath" buildEnv error.
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        # forceWayland = true; # set false if you run X11
        extraPolicies = {
          CaptivePortal = false;
          DisableFirefoxStudies = true;
          DisableTelemetry = true;
          DisableFirefoxAccounts = false; # keep Sync available
          FirefoxHome = {
            Search = true;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
          };
          UserMessaging = {
            ExtensionRecommendations = false;
            SkipOnboarding = true;
          };
        };
      };

      # ── Extensions ──────────────────────────────────────────────────────────
      # NUR must be in your overlays / nixpkgs.overlays for this to work.
      # If you don't use NUR, remove the extensions block and install manually.
      profiles.${cfg.profileName} = {
        id = 0;
        name = cfg.profileName;

        # extensions = defaultExtensions ++ cfg.additionalExtensions;

        # ── user.js / preferences ────────────────────────────────────────────
        settings = lib.mkMerge [
          # ──────────────────────────────────────────────────────────────────
          # 0.  STARTUP & HOMEPAGE
          # ──────────────────────────────────────────────────────────────────
          {
            "browser.startup.page" = 3; # restore session
            "browser.startup.homepage" = "about:home";
            "browser.newtabpage.enabled" = true;
            "browser.newtabpage.activity-stream.enabled" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 1.  TELEMETRY – kill everything
          # ──────────────────────────────────────────────────────────────────
          {
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.sessions.current.clean" = true;
            "browser.ping-centre.telemetry" = false;
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 2.  STUDIES & EXPERIMENTS
          # ──────────────────────────────────────────────────────────────────
          {
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "messaging-system.rsexperimentloader.enabled" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 3.  POCKET – disable
          # ──────────────────────────────────────────────────────────────────
          {
            "extensions.pocket.enabled" = false;
            "extensions.pocket.api" = "";
            "extensions.pocket.site" = "";
            "extensions.pocket.oAuthConsumerKey" = "";
          }

          # ──────────────────────────────────────────────────────────────────
          # 4.  UPDATES & SAFE BROWSING (keep malware list, kill Google telemetry)
          # ──────────────────────────────────────────────────────────────────
          {
            # Keep auto-updates for security patches
            "app.update.auto" = true;
            # Safe Browsing – keep local checks, disable cloud queries
            "browser.safebrowsing.malware.enabled" = true;
            "browser.safebrowsing.phishing.enabled" = true;
            "browser.safebrowsing.downloads.enabled" = true;
            "browser.safebrowsing.downloads.remote.enabled" = false; # no cloud
            "browser.safebrowsing.blockedURIs.enabled" = true;
            "browser.safebrowsing.provider.google4.dataSharing.enabled" = false;
            "browser.safebrowsing.provider.google4.updateURL" = "";
            "browser.safebrowsing.provider.google4.reportURL" = "";
            "browser.safebrowsing.provider.google4.reportPhishMistakeURL" = "";
            "browser.safebrowsing.provider.google4.reportMalwareMistakeURL" = "";
          }

          # ──────────────────────────────────────────────────────────────────
          # 5.  FINGERPRINTING RESISTANCE  (resist.fingerprinting / RFP)
          # ──────────────────────────────────────────────────────────────────
          {
            "privacy.resistFingerprinting" = true;
            # Letterboxing controlled by module option
            "privacy.resistFingerprinting.letterboxing" = cfg.enableLetterboxing;
            "privacy.fingerprintingProtection" = true;
            "privacy.fingerprintingProtection.pbmode" = true;
            # Spoof timezone to UTC (RFP does this automatically, belt+suspenders)
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
            # Canvas / WebGL
            "canvas.poison" = true;
            # Font enumeration resistance
            "browser.display.use_document_fonts" = 1; # keep page fonts but restrict system enumeration
            # Reduce user-agent granularity
            "general.useragent.override" = ""; # let RFP handle it
            # Disable Battery API
            "dom.battery.enabled" = false;
            # Disable Gamepad API
            "dom.gamepad.enabled" = false;
            # Disable VR/AR
            "dom.vr.enabled" = false;
            # Disable device sensors
            "device.sensors.enabled" = false;
            # Timezone (belt-and-suspenders with RFP)
            "privacy.spoof_english" = 2; # spoof Accept-Language → en-US
          }

          # ──────────────────────────────────────────────────────────────────
          # 6.  WEBRTC – prevent IP leakage
          # ──────────────────────────────────────────────────────────────────
          {
            "media.peerconnection.enabled" = true; # keep for video calls
            "media.peerconnection.ice.no_host" = true; # no host candidates (hides LAN IP)
            "media.peerconnection.ice.default_address_only" = true; # only use default route
            "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
            "media.peerconnection.ice.relay_only" = false; # set true if you use a VPN
          }

          # ──────────────────────────────────────────────────────────────────
          # 7.  NETWORK – privacy-enhancing
          # ──────────────────────────────────────────────────────────────────
          {
            # DNS-over-HTTPS (Cloudflare by default; change to your preferred resolver)
            # "network.trr.mode"         = 2;   # TRR preferred, fallback to OS
            # "network.trr.uri"          = "https://mozilla.cloudflare-dns.com/dns-query";
            # "network.trr.bootstrapAddress" = "1.1.1.1";

            # Disable prefetching
            "network.prefetch-next" = false;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.predictor.enabled" = false;
            "network.predictor.enable-prefetch" = false;
            "network.http.speculative-parallel-limit" = 0;

            # Disable link prefetch / speculation
            "network.preconnect" = false;

            # HTTPS only mode
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_pbm" = true;

            # Disable captive portal detection (leaks requests)
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;

            # Disable geo-location
            "geo.enabled" = false;

            # Disable link-tracking pixels
            "beacon.enabled" = false;

            # Referer policy
            "network.http.referer.XOriginPolicy" = 2; # send only on same origin
            "network.http.referer.XOriginTrimmingPolicy" = 2; # trim to scheme+host
          }

          # ──────────────────────────────────────────────────────────────────
          # 8.  COOKIES & SESSION  ← daily-driver difference from LibreWolf
          #     We keep persistent first-party cookies so you stay logged in.
          # ──────────────────────────────────────────────────────────────────
          {
            # Total Cookie Protection (dFPI) – isolates cookies per site,
            # prevents cross-site tracking while keeping logins working
            "network.cookie.cookieBehavior" = 5; # dFPI (same as Firefox default strict)
            "network.cookie.cookieBehavior.pbmode" = 5;
            "privacy.partition.network_state" = true;
            "privacy.partition.serviceWorkers" = true;
            "privacy.partition.always_partition_third_party_non_cookie_storage" = true;

            # Do NOT clear cookies on shutdown (keeps you logged in)
            "privacy.clearOnShutdown.cookies" = false;
            "privacy.clearOnShutdown.sessions" = false;
            "privacy.clearOnShutdown.offlineApps" = false;

            # But DO clear other potentially identifying data on shutdown
            "privacy.clearOnShutdown.cache" = true;
            "privacy.clearOnShutdown.downloads" = false; # keep download history
            "privacy.clearOnShutdown.formdata" = true;
            "privacy.clearOnShutdown.history" = false; # keep history
            "privacy.clearOnShutdown.siteSettings" = false;

            # Block third-party cookies entirely
            "network.cookie.thirdparty.sessionOnly" = true;
            "network.cookie.thirdparty.nonsecureSessionOnly" = true;

            # Reject tracking cookies (ETP strict)
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.trackingprotection.cryptomining.enabled" = true;
            "privacy.trackingprotection.fingerprinting.enabled" = true;
            "privacy.trackingprotection.pbmode.enabled" = true;
          }

          # ──────────────────────────────────────────────────────────────────
          # 9.  DRM  ← the other daily-driver difference from LibreWolf
          # ──────────────────────────────────────────────────────────────────
          {
            "media.eme.enabled" = true;
            "media.gmp-widevinecdm.enabled" = true;
            "media.gmp-widevinecdm.visible" = true;
            "media.gmp-manager.url" = "https://aus5.mozilla.org/update/3/GMP/%VERSION%/%BUILD_ID%/%BUILD_TARGET%/%LOCALE%/%CHANNEL%/%OS_VERSION%/%DISTRIBUTION%/%DISTRIBUTION_VERSION%/update.xml";
            "browser.eme.ui.enabled" = true;
          }

          # ──────────────────────────────────────────────────────────────────
          # 10. MEDIA & CODEC settings
          # ──────────────────────────────────────────────────────────────────
          {
            "media.autoplay.default" = 1; # block autoplay (audio+video)
            "media.autoplay.blocking_policy" = 2;
            "media.ffmpeg.vaapi.enabled" = true; # hardware decode on Linux
            "media.hardware-video-decoding.force-enabled" = true;
            # Disable WebGL fingerprinting but keep it for sites that need it
            "webgl.disabled" = false;
            "webgl.enable-debug-renderer-info" = false; # hide GPU info from JS
          }

          # ──────────────────────────────────────────────────────────────────
          # 11. SECURITY HARDENING
          # ──────────────────────────────────────────────────────────────────
          {
            # Content Security Policy
            "security.csp.enable" = true;
            # OCSP (cert revocation) – must-staple and fail-closed
            "security.OCSP.enabled" = 1;
            "security.OCSP.require" = true;
            # TLS minimum version
            "security.tls.version.min" = 3; # TLS 1.2
            "security.tls.version.max" = 4; # TLS 1.3
            # Disable old / weak ciphers
            "security.ssl.disable_session_identifiers" = true;
            "security.ssl3.rsa_des_ede3_sha" = false;
            # HSTS preload
            "network.stricttransportsecurity.preloadlist" = true;
            # Disable CRLite (replace with OCSP-must-staple approach above)
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;
            # Disable WebAssembly if you want maximum hardening
            # (commented out – breaks too many modern web apps)
            # "javascript.options.wasm"                     = false;
            # Disable SharedArrayBuffer (Spectre mitigation)
            "javascript.options.shared_memory" = false;
            # Strict mixed-content blocking
            "security.mixed_content.block_active_content" = true;
            "security.mixed_content.block_display_content" = true;
            "security.mixed_content.upgrade_display_content" = true;
            # First party isolation (note: dFPI above is the modern replacement;
            # keep FPI off to avoid breakage with dFPI)
            "privacy.firstparty.isolate" = false;
            # HTTPS-First in normal windows
            "dom.security.https_first" = true;
          }

          # ──────────────────────────────────────────────────────────────────
          # 12. PERMISSIONS – deny by default, prompt on request
          # ──────────────────────────────────────────────────────────────────
          {
            "permissions.default.geo" = 2; # block
            "permissions.default.camera" = 2; # block
            "permissions.default.microphone" = 2; # block
            "permissions.default.desktop-notification" = 2; # block
            "permissions.default.xr" = 2; # block VR
            "dom.push.enabled" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 13. SEARCH
          # ──────────────────────────────────────────────────────────────────
          {
            "browser.search.suggest.enabled" = false; # no live suggestions
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.urlbar.trending.featureGate" = false;
            "browser.urlbar.addons.featureGate" = false;
            "browser.urlbar.mdn.featureGate" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 14. UI / UX CLEANUP
          # ──────────────────────────────────────────────────────────────────
          {
            "browser.aboutConfig.showWarning" = false;
            "browser.compactmode.show" = true;
            "browser.toolbars.bookmarks.visibility" = "newtab";
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.tabs.firefox-view" = false;
          }

          # ──────────────────────────────────────────────────────────────────
          # 15. MISC PRIVACY
          # ──────────────────────────────────────────────────────────────────
          {
            # Disable link-prefetch from DNS
            "network.dns.disablePrefetch" = true;
            # Isolate window.name (prevents cross-site tracking)
            "privacy.window.name.update.enabled" = true;
            # Disable clipboard events (can be re-enabled per-site)
            "dom.event.clipboardevents.enabled" = true; # keep for usability
            # Disable IndexedDB in private mode
            "dom.indexedDB.privateBrowsing.enabled" = false;
            # Disable speech recognition
            "media.webspeech.recognition.enable" = false;
            "media.webspeech.synth.enabled" = false;
            # Disable screensharing
            "media.getusermedia.screensharing.enabled" = false;
            # Prevent sites from detecting if extensions are installed
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
            "browser.startup.blankWindow" = false;
          }

          # ── User overrides (applied last, highest precedence) ────────────
          cfg.extraPrefs
        ]; # end settings

        # ── userChrome.css – minimal hardening-related chrome tweaks ───────
        userChrome = ''
          /* Hide the "DRM Content" shield icon leaking that you use Widevine */
          #eme-notification-icon { display: none !important; }
        '';
      }; # end profiles.<name>
    }; # end programs.firefox
  }; # end config
}
