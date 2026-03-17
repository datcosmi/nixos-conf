{lib, ...}:
with lib; {
  options.my.hardware = {
    host = mkOption {
      type = types.enum ["desktop" "laptop"];
      default = "desktop";
      description = "Host type";
    };

    gpu = mkOption {
      type = types.enum ["nvidia" "amd" "intel" "none"];
      default = "none";
      description = "GPU vendor";
    };

    hybrid = mkOption {
      type = types.bool;
      default = false;
    };

    prime = {
      intelBusId = mkOption {
        type = types.nullOr types.str;
        default = null;
      };

      nvidiaBusId = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };
  };
}
