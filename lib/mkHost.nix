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
  userNames = lib.attrNames users;
in
  nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs users;};
    modules =
      [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        catppuccin.nixosModules.catppuccin
        ../hosts/${hostname}
        {
          system.activationScripts.createNixUserProfiles = lib.stringAfter ["users"] ''
            for user in ${lib.concatStringsSep " " userNames}; do
              home=$(getent passwd $user | cut -d: -f6)
              mkdir -p /nix/var/nix/profiles/per-user/$user
              chown $user:users /nix/var/nix/profiles/per-user/$user
              mkdir -p /nix/var/nix/gcroots/per-user/$user
              chown $user:users /nix/var/nix/gcroots/per-user/$user
              mkdir -p $home/.local/state/nix/profiles
              mkdir -p $home/.local/share
              mkdir -p $home/.config
              mkdir -p $home/.cache
              chown -R $user:users $home
            done
          '';

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
