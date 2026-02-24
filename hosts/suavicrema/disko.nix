{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/sda";

      content = {
        type = "gpt";
        partitions = {
          EFI = {
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot/efi";
            };
          };

          BOOT = {
            size = "1G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/boot";
            };
          };

          SWAP = {
            size = "8G";
            content = {
              type = "swap";
              randomEncryption = true;
            };
          };

          nixos = {
            size = "730G";
            content = {
              type = "luks";
              name = "cryptnix";

              settings.allowDiscards = true;

              extraFormatArgs = [
                "--type"
                "luks2"
                "--cipher"
                "aes-xts-plain64"
                "--key-size"
                "512"
                "--hash"
                "sha512"
                "--pbkdf"
                "argon2id"
              ];

              content = {
                type = "btrfs";
                extraArgs = ["-L" "nixos"];

                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = [
                      "noatime"
                      "compress=zstd"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                    ];
                  };

                  "@home" = {mountpoint = "/home";};
                  "@nix" = {mountpoint = "/nix";};
                  "@log" = {mountpoint = "/var/log";};
                  "@snapshots" = {mountpoint = "/.snapshots";};
                };
              };
            };
          };

          arch = {
            size = "100%";
            content = {
              type = "luks";
              name = "cryptarch";

              settings.allowDiscards = true;

              extraFormatArgs = [
                "--type"
                "luks2"
                "--cipher"
                "aes-xts-plain64"
                "--key-size"
                "512"
                "--hash"
                "sha512"
                "--pbkdf"
                "argon2id"
              ];

              content = {
                type = "btrfs";
                extraArgs = ["-L" "arch"];
              };
            };
          };
        };
      };
    };
  };
}
