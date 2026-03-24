{
  lib,
  config,
  ...
}: let
  cfg = config.my.profiles;

  has = profile: builtins.elem profile cfg;
in {
  options.my.profiles = lib.mkOption {
    type = lib.types.listOf (lib.types.enum [
      "base"
      "personal"
      "gaming"
      "minimal"
    ]);
    default = ["base"];
    description = "High-level system profiles";
  };

  config = lib.mkMerge [
    (lib.mkIf (has "base") {
      my.features = {
        system = {
          networking.avahi.enable = lib.mkDefault true;
        };

        security = {
          polkitAgent.enable = lib.mkDefault true;
        };
      };
    })

    (lib.mkIf (has "personal") {
      my.features = {
        desktop = {
          enable = lib.mkDefault true;
          niri.enable = lib.mkDefault true;
          fonts.enable = lib.mkDefault true;
          apps = {
            enable = lib.mkDefault true;
            zen-browser = {
              enable = lib.mkDefault true;
            };
          };
        };

        system = {
          bluetooth.enable = lib.mkDefault true;
          flatpak.enable = lib.mkDefault true;
          printing.enable = lib.mkDefault true;

          networking = {
            enable = lib.mkDefault true;
            dns.enable = lib.mkDefault true;
            firewall.enable = lib.mkDefault true;
            ipv6.enable = lib.mkDefault true;
            networkManager.enable = lib.mkDefault true;
          };
        };

        security = {
          gnomeKeyring.enable = lib.mkDefault true;
        };
      };
    })

    (lib.mkIf (has "gaming") {
      my.features = {
        gaming.enable = lib.mkDefault true;
      };
    })

    (lib.mkIf (has "minimal") {
      my.features = {
        desktop.enable = lib.mkDefault false;

        system = {
          networking.enable = lib.mkDefault false;
        };
      };
    })
  ];
}
