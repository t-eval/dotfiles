{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.coding.terminal;
in {
  options = {
    coding.terminal = {
      ghostty = mkEnableOption "ghostty";
    };
  };

  config = lib.mkIf cfg.ghostty {
    stylix.targets.ghostty.enable = true;

    programs.ghostty = {
      enable = true;
      package = null; # Broken on darwin systems

      enableZshIntegration = true;
      settings = {
        font-family = lib.mkForce "Berkeley Mono";
        font-thicken = true;
        window-padding-balance = true;
        window-padding-x = 10;
        maximize = true;
      };
    };
  };
}
