{ ... }: {

  services.nix-daemon.enable = true;
  system = {
    stateVersion = 5;
    defaults.CustomSystemPreferences = {
      "com.apple.AdLib" = {
        allowApplePersonalizedAdvertising = false;
        allowAssistant = false;
      };
      "com.apple.ImageCapture".disableHotPlug = true;
      "com.apple.Safari" = {
        "com.apple.Safari.WarnAboutFraudulentWebsites" = true;
        "com.apple.Safari.SearchProviderIdentifier" = "com.duckduckgo";
        "com.apple.Safari.AutoFillPasswords" = false;
        "com.apple.Safari.AutoFillCreditCardData" = false;
        "com.apple.Safari.AutoFillMiscellaneousForms" = false;
        "com.apple.Safari.IncludeDevelopMenu" = true;
        "com.apple.Safari.WebKitDeveloperExtras" = true;
        "com.apple.Safari.ShowFavoritesBar" = true;
      };
    };
  };

  imports = [
    ./dock.nix
    ./finder.nix
    ./base.nix
    ./loginwindow.nix
    ./clock.nix
    ./globaldomain.nix
    ./homebrew.nix
  ];

}
