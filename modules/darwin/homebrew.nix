{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.darwin.homebrew;
in {
  options = {
    darwin.homebrew = with types; {
      casks = mkOption {
        type = listOf str;
        default = [];
        description = "Which casks to install with homebrew";
      };
      masApps = mkOption {
        type = attrsOf ints.positive;
        default = {};
        description = "Which MacOS apps to install with hombrew";
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
      masApps = cfg.masApps;
      casks = cfg.casks ++ ["firefox"];
    };
  };
}
