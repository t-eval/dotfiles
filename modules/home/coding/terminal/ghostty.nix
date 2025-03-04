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
    xdg.configFile."ghostty/config".text = ''
      theme = GruvboxDarkHard

      font-family = Berkeley Mono
      font-size = 13
      font-thicken = true
      font-style = Bold
      font-style-italic = Bold Italic


      window-padding-balance = true
      window-width = 130
      window-height = 40
      window-position-x = 225
      window-position-y = 120
    '';
  };
}
