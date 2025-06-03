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
    programs.ghostty = {
      enable = true;
      package = null; # Broken on darwin systems

      enableZshIntegration = true;
      settings = {
        font-family = "Berkeley Mono";
        font-style = "Bold";
        font-style-italic = "Bold Italic";
        font-thicken = true;
        font-size = 13;
        background = 111111;
        window-padding-balance = true;
        window-padding-x = 10;
        maximize = true;
      };
    };
  };
}
