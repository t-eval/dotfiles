{ ... }: {

  system = {
    stateVersion = 5;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  imports = [ ./base.nix ./homebrew.nix ./defaults.nix ];
}
