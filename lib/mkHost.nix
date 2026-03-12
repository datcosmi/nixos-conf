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
}:
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
