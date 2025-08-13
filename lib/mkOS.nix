{
  self,
  inputs,
  ...
}: let
  get_nix_config = system: {
    nix = {
      optimise.automatic = true;
      gc = {
        automatic = true;
        interval = {
          Weekday = 0;
          Hour = 0;
          Minute = 0;
        };
        options = "--delete-older-than 7d";
      };
      settings = {
        experimental-features = "nix-command flakes";
      };
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    };

    nixpkgs = {
      hostPlatform = system;
      config.allowUnfreePredicate = _: true;
      overlays = [inputs.nur.overlays.default];
    };
  };
in {
  mkMacOS = {
    macModule,
    homeModule,
    system ? "aarch64-darwin",
    hostname,
  }:
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit hostname;
      };
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {
              imports = [
                self.homeModules
                inputs.nixvim.homeModules.nixvim
                homeModule
              ];
            };
          };
        }
        self.darwinModules
        macModule
        (get_nix_config system)
      ];
    };
}
