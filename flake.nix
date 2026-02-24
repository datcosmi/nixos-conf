{
  description = "Suavicrema Hyprland";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    catppuccin,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      suavicrema = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          catppuccin.nixosModules.catppuccin

          ./hosts/suavicrema/disko.nix
          ./hosts/suavicrema/configuration.nix
          ./hosts/suavicrema/hardware-configuration.nix
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs;};
              users.ivan = import ./home/ivan/home.nix;
              sharedModules = [
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
  };
}
