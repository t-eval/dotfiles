{
  description = "Tommaso Bruno's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin .url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {self, ...} @ inputs: let
    os_lib = import ./lib/mkOS.nix {inherit self inputs;};
  in
    with os_lib; {
      darwinConfigurations = {
        personal = mkMacOS {
          macModule = ./hosts/macos-laptop/darwin.nix;
          homeModule = ./hosts/macos-laptop/home.nix;
          hostname = "void";
        };
      };

      darwinModules = import ./modules/darwin;
      homeModules = import ./modules/home;
    };
}
