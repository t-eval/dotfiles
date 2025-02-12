{
  self,
  inputs,
  ...
}: {
  mkMacOS = {
    macModule,
    homeModule,
    system,
    hostname,
  }: let
    nixCommon = import ./mkNixCommon.nix {inherit system inputs;};
  in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit system inputs;
      };
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {imports = [self.homeModules homeModule];};
          };
        }
        self.darwinModules
        macModule
        nixCommon
      ];
    };
}
