{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.apps.obsidian;
in {
  options = {
    apps.obsidian.enable = mkEnableOption "obsidian";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [obsidian];
  };
}
