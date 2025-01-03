{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.macos.homebrew;
in {
  options = {
    macos.homebrew = with types; {
      casks = mkOption {
        type = listOf str;
        description = "Which casks to install with homebrew";
      };
    };
  };

  config = {
    nix-homebrew = {
      enable = true;
      user = "void";
      enableRosetta = true;
      autoMigrate = true;
    };

    homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true;
        cleanup = "zap";
        upgrade = true;
      };
      casks = cfg.casks;
    };
  };
}
