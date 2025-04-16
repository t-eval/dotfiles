{
  inputs,
  system,
  ...
}: {
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
    settings = {experimental-features = "nix-command flakes";};
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  nixpkgs = {
    hostPlatform = system;
    config.allowUnfreePredicate = _: true;
    overlays = [inputs.nur.overlays.default];
  };
}
