{
  lib,
  config,
  ...
}:
with lib; let
  cfg_dock = config.macos.dock;
in {
  options = {
    macos = {
      dock = with types; {
        apps = mkOption {
          type = listOf str;
          description = "Which apps to always show in the dock";
        };

        folders = mkOption {
          type = listOf str;
          description = "Which folders to always show in the dock";
          default = [];
        };

        hide = mkOption {
          type = bool;
          description = "Whether to automatically hide the dock";
        };
      };
    };
  };

  config = {
    system.defaults = {
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
        autohide = cfg_dock.hide;
        persistent-apps = cfg_dock.apps ++ ["/Applications/Firefox Developer Edition.app"];
        persistent-others = cfg_dock.folders;
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
}
