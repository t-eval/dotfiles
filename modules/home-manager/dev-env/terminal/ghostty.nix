{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.dev-env.terminal;
in {
  options = {
    dev-env.terminal = {
      ghostty = mkEnableOption "ghostty";
    };
  };

  config = lib.mkIf cfg.ghostty {
    xdg.configFile."ghostty/config".text = ''
      background = 000000
      foreground = ffffff

      font-family = Berkeley Mono
      font-size = 13

      window-padding-balance = true
      window-decoration = true
      window-width = 3000
      window-height = 3000
    '';
  };
}
