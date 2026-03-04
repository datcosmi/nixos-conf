{lib, ...}:
with lib; {
  options.my.hardware = {
    gpu = mkOption {
      type = types.enum ["nvidia-turing" "amd" "intel" "none"];
      default = "none";
      description = "GPU vendor";
    };
  };
}
