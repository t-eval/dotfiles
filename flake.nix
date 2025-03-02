{
  description = "Tommaso Bruno's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    macosLib = import ./lib/mkMacOS.nix {inherit self inputs;};

    personal-laptop-system = "aarch64-darwin";
  in {
    darwinConfigurations = with macosLib; {
      personal = mkMacOS {
        macModule = ./machines/${personal-laptop-system}/darwin.nix;
        homeModule = ./machines/${personal-laptop-system}/home.nix;
        hostname = "void";
        system = personal-laptop-system;
      };
    };

    formatter.${personal-laptop-system} =
      nixpkgs
      .legacyPackages
      .${personal-laptop-system}
      .alejandra;

    darwinModules = import ./modules/darwin;
    homeModules = import ./modules/home;
  };
}
