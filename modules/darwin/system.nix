{
  lib,
  config,
  hostname,
  ...
}:
with lib; let
  cfg_dock = config.darwin.dock;
in {
  options = {
    darwin = {
      dock = with types; {
        persistent-apps = mkOption {
          type = listOf str;
          default = [];
          description = "Which apps to always show in the dock";
        };

        persistent-folders = mkOption {
          type = listOf str;
          default = [];
          description = "Which folders to always show in the dock";
        };
      };
    };
  };

  config = {
    system = {
      stateVersion = 6;
      primaryUser = hostname;
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
      };

      defaults = {
        menuExtraClock = {
          IsAnalog = false;
          Show24Hour = false;
          ShowAMPM = true;
          ShowDate = null;
          ShowDayOfMonth = true;
          ShowDayOfWeek = true;
          ShowSeconds = false;
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

        finder = {
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          CreateDesktop = false;
          FXDefaultSearchScope = "SCcf";
          FXPreferredViewStyle = "clmv";
          FXEnableExtensionChangeWarning = false;
          QuitMenuItem = false;
          ShowPathbar = true;
          ShowStatusBar = true;
          _FXShowPosixPathInTitle = false;
          _FXSortFoldersFirst = true;
        };

        dock = {
          launchanim = false;
          magnification = false;
          minimize-to-application = true;
          mineffect = null;
          tilesize = 48;
          show-recents = false;
          autohide = true;
          persistent-apps = cfg_dock.persistent-apps ++ ["/Applications/Firefox.app"];
          persistent-others = cfg_dock.persistent-folders;
        };

        loginwindow = {
          SHOWFULLNAME = false;
          GuestEnabled = false;
        };

        # Custom preferences
        CustomSystemPreferences = {
          "com.apple.AdLib" = {
            allowApplePersonalizedAdvertising = false;
            allowAssistant = false;
          };
        };
      };
    };
  };
}
