{ lib, config, ... }:
with lib;
let cfg = config.macos.dock;
in {

  options = {
    macos.dock = with types; {
      apps = mkOption {
        type = listOf str;
        description = "Which apps to always show in the dock";
      };

      folders = mkOption {
        type = listOf str;
        description = "Which folders to always show in the dock";
        default = [ ];
      };

      hide = mkOption {
        type = bool;
        description = "Whether to automatically hide the dock";
      };
    };
  };

  config = {
    system.defaults.dock = {
      launchanim = false;
      magnification = false;
      minimize-to-application = true;
      mineffect = null;
      tilesize = 48;
      show-recents = false;
      autohide = cfg.hide;
      persistent-apps = cfg.apps;
      persistent-others = cfg.folders;
    };
  };
}
