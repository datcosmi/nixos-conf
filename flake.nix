{
  description = "Suavicrema";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    niri = {
      url = "github:niri-wm/niri?ref=wip/branch";
      # url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkHost = import ./lib/mkHost.nix {
      inherit inputs nixpkgs;
    };
  in {
    nixosConfigurations = {
      suavicrema = mkHost {
        hostname = "suavicrema";
        system = "x86_64-linux";
      };

      mandarina = mkHost {
        hostname = "mandarina";
        system = "x86_64-linux";
      };
    };
  };
}
