{
  inputs,
  nixpkgs,
}: {
  hostname,
  system,
}:
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {inherit inputs;};

  modules = [
    inputs.disko.nixosModules.disko
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin

    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {inherit inputs;};
        sharedModules = [
          inputs.catppuccin.homeModules.catppuccin
        ];
      };
    }

    ../hosts/${hostname}
  ];
}
