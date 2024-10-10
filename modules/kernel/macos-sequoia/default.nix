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
    };
  };

  imports = [ ./dock.nix ./finder.nix ./base.nix ];

}
