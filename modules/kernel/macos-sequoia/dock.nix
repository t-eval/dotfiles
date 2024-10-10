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
      enable-spring-load-actions-on-all-items = false;
      appswitcher-all-displays = false;
      autohide-delay = 0.24;
      autohide-time-modifier = 1.0;
      dashboard-in-overlay = false;
      expose-animation-duration = 1.0;
      expose-group-by-app = true;
      largesize = 16;
      mouse-over-hilite-stack = false;
      mru-spaces = true;
      orientation = "bottom";
      persistent-others = cfg.folders;
      show-process-indicators = true;
      showhidden = false;
      slow-motion-allowed = false;
      static-only = false;
      wvous-bl-corner = null;
      wvous-br-corner = null;
      wvous-tl-corner = null;
      wvous-tr-corner = null;
    };
  };
}
