{
  lib,
  config,
  system,
  inputs,
  ...
}:
with lib; let
  cfg = config.nix;
in {
  options = {
    nix = {
      unfree_apps = with types;
        mkOption {
          type = nullOr (listOf str);
          description = "Which unfree apps to allow";
          default = [];
        };
    };
  };

  config = {
    services.nix-daemon.enable = true;
    nix = {
      optimise.automatic = true;
      gc.automatic = true;
      settings = {experimental-features = "nix-command flakes";};
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    };

    nixpkgs = {
      hostPlatform = system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (getName pkg) cfg.unfree_apps;
      overlays = [inputs.nur.overlays.default];
    };
  };
}
