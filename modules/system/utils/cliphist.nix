{
  lib,
  config,
  users,
  ...
}: let
  userNames = lib.attrNames users;

  mkFs = user: let
    u = config.users.users.${user};
  in {
    "/home/${user}/.local/share/cliphist" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = [
        "size=50M"
        "nodev"
        "nosuid"
        "noexec"
        "mode=700"
      ];
    };
  };
in {
  fileSystems = lib.mkMerge (map mkFs userNames);
}
