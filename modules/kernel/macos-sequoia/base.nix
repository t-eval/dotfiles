{ pkgs, lib, config, ... }:
with lib;
let cfg = config.macos.base;
in {
  options = {
    macos.base = with types; {
      timeZone = mkOption {
        type = nullOr str;
        description = "Which timeZone to enable";
        default = "Europe/London";
      };

      useTouchIdForSudo = mkOption {
        type = nullOr bool;
        description = "Whether to enable the use of touch id for sudo commands";
        default = false;
      };
    };
  };

  config = {
    time.timeZone = cfg.timeZone;
    security.pam.enableSudoTouchIdAuth = cfg.useTouchIdForSudo;

    programs.zsh.enable = true;
    environment = {
      shells = [ pkgs.zsh ];
      systemPackages = with pkgs; [ vim appcleaner ];
    };
  };
}
