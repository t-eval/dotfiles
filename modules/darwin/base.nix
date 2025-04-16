{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.darwin.base;
in {
  options = {
    darwin.base = with types; {
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
    security.pam.services.sudo_local.touchIdAuth = cfg.useTouchIdForSudo;
    documentation.man.enable = true;

    programs.zsh.enable = true;
    environment = {
      shells = [pkgs.zsh];
      systemPackages = with pkgs; [vim man];
    };
  };
}
