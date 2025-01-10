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
  }:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit system inputs;
      };
      modules = [
        self.nixCommon
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
      ];
    };
}
