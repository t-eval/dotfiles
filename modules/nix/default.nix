{ lib, config, system, ... }:
with lib;
let cfg = config.nix;
in {
  options = {
    nix = {
      unfree_apps = with types;
        mkOption {
          type = nullOr (listOf str);
          description = "Which unfree apps to allow";
          default = [ ];
        };
    };
  };

  config = {
    services.nix-daemon.enable = true;
    nix = {
      optimise.automatic = true;
      gc.automatic = true;
      settings = { experimental-features = "nix-command flakes"; };
    };

    nixpkgs = {
      hostPlatform = system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (getName pkg) cfg.unfree_apps;
    };
  };
}
