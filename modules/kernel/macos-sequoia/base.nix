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
    environment = {
      variables = {
        EDITOR = "nvim";
        LANG = "ko_KR.UTF-8";
      };
    };

    system = {

      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
      };

      defaults = {
        loginwindow = {
          SHOWFULLNAME = false;
          GuestEnabled = false;
        };

        NSGlobalDomain = {
          AppleInterfaceStyle = "Dark";
          AppleInterfaceStyleSwitchesAutomatically = false;
          AppleMeasurementUnits = "Centimeters";
          AppleTemperatureUnit = "Celsius";
          NSAutomaticCapitalizationEnabled = false;
          NSDocumentSaveNewDocumentsToCloud = false;
          NSScrollAnimationEnabled = true;
          _HIHideMenuBar = false;
        };

        WindowManager = {
          StandardHideDesktopIcons = true;
          StandardHideWidgets = true;
        };

        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
        screencapture = {
          location = "~/Pictures";
          show-thumbnail = false;
          type = "png";
        };
      };
    };

    time.timeZone = cfg.timeZone;
    security.pam.enableSudoTouchIdAuth = cfg.useTouchIdForSudo;

    programs.zsh.enable = true;
    environment = {
      shells = [ pkgs.zsh ];
      systemPackages = with pkgs; [ vim ];
    };
  };
}
