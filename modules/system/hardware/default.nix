{lib, ...}:
with lib; {
  options.my.hardware = {
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
