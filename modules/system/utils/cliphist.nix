{
  lib,
  config,
  users,
  ...
}: let
  userNames = lib.attrNames users;

  mkFs = user: let
    u = config.users.users.${user};
    gid = config.users.groups.${u.group}.gid;
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
        "uid=${toString u.uid}"
        "gid=${toString gid}"
      ];
    };
  };
in {
  fileSystems = lib.mkMerge (map mkFs userNames);
}
