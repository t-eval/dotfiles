{ ... }: {

  services.nix-daemon.enable = true;
  system = {
    stateVersion = 5;
    defaults.CustomSystemPreferences = {
      "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
    };
  };

  imports = [ ./dock.nix ./finder.nix ./base.nix ];

}
