{lib, ...}:
with lib; {
  options.my.hardware = {
    gpu = mkOption {
      type = types.enum ["nvidia" "amd" "intel" "none"];
      default = "none";
      description = "GPU vendor";
    };
  };
}
