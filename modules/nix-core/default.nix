{
  system,
  inputs,
  ...
}: {
  services.nix-daemon.enable = true;
  nix = {
    optimise.automatic = true;
    gc.automatic = true;
    settings = {experimental-features = "nix-command flakes";};
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  nixpkgs = {
    hostPlatform = system;
    config.allowUnfreePredicate = _: true;
    overlays = [inputs.nur.overlays.default];
  };
}
