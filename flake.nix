{
  description = "Suavicrema Hyprland";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    swww.url = "github:LGFae/swww";

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
      # inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... } @inputs: {
    nixosConfigurations.suavicrema = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/suavicrema/configuration.nix

        catppuccin.nixosModules.catppuccin
      	home-manager.nixosModules.home-manager
      	{
      	  home-manager = {
      	    useGlobalPkgs = true;
      	    useUserPackages = true;
      	    users.ivan = {
              imports = [
                ./home/ivan/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };
      	    backupFileExtension = "backup";

            extraSpecialArgs = {
              inherit inputs;
            };
      	  };
      	}
      ];
    };
  };
}
