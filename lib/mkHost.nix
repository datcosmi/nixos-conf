{
  nixpkgs,
  disko,
  catppuccin,
  home-manager,
  inputs,
}: {
  hostname,
  users,
  system ? "x86_64-linux",
  extraModules ? [],
}: let
  lib = nixpkgs.lib;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs;};
    modules =
      [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        catppuccin.nixosModules.catppuccin
        ../hosts/${hostname}
        {
          systemd.tmpfiles.rules = lib.concatMap (user: [
            "d /nix/var/nix/profiles/per-user/${user} 0755 ${user} users -"
            "d /nix/var/nix/gcroots/per-user/${user} 0755 ${user} users -"
          ]) (lib.attrNames users);

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {inherit inputs;};
            inherit users;
            sharedModules = [
              inputs.catppuccin.homeModules.catppuccin
            ];
          };
        }
      ]
      ++ extraModules;
  }
