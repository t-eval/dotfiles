{inputs, ...}: {
  mkMacOS = {
    macModule,
    homeModule,
    system,
    hostname,
  }: let
    kernel-modules = import ../modules/nix-darwin;
    home-modules = import ../modules/home-manager;
    nix-modules = import ../modules/nix-core;
  in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit system inputs;
      };
      modules = [
        nix-modules
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {imports = [home-modules homeModule];};
            extraSpecialArgs = {
              # ghostty = inputs.ghostty;
              inherit system;
            };
          };
        }
        kernel-modules
        macModule
      ];
    };
}
