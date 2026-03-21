{
  lib,
  config,
  ...
}: let
  cfg = config.my.profiles;

  has = profile: builtins.elem profile cfg;
in {
  imports = [
    ../modules/system/hardware
    ../modules/system/boot
    ../modules/system/graphics
    ../modules/system/core/nix.nix

    ../modules/system/networking
    ../modules/system/audio.nix
    ../modules/system/services
    ../modules/system/memory.nix
    ../modules/system/env.nix
    ../modules/system/utils
    ../modules/system/gaming.nix
    ../modules/system/display.nix
    ../modules/system/login/tuigreet.nix

    ../modules/system/desktop
    ../modules/system/cachix.nix
  ];

  options.my.profiles = lib.mkOption {
    type = lib.types.listOf (lib.types.enum [
      "base"
      "desktop"
      "gaming"
      "minimal"
    ]);
    default = ["base"];
    description = "High-level system profiles";
  };

  config = lib.mkMerge [
    (lib.mkIf (has "base") {
      my.features = {
        # system = {
        #   avahi.enable = lib.mkDefault true;
        # };

        security = {
          polkitAgent.enable = lib.mkDefault true;
        };
      };
    })

    (lib.mkIf (has "desktop") {
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
        gaming.enable = lib.mkDefault false;
      };
    })
  ];
}
