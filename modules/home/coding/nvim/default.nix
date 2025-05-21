{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.coding.nvim;
in {
  options = {
    coding.nvim = with types; {
      enable = mkEnableOption "nvim";
    };
  };

  config = mkIf cfg.enable {
    stylix.targets.nixvim.enable = true;
    programs.nixvim = {
      enable = true;
      enableMan = true;

      viAlias = true;
      vimAlias = true;

      extraPackages = with pkgs; [
        ripgrep
        alejandra
      ];

      diagnostic.settings = {
        virtual_text = true;
        signs = true;
        underline = false;
        virtual_lines = false;
      };

      highlightOverride = {
        SignColumn.bg = "none";
        LineNr.bg = "none";
        LineNrAbove.bg = "none";
        LineNrBelow.bg = "none";
        FoldColumn.bg = "none";
        CursorLineNr.bg = "none";
      };
    };
  };

  imports = [
    ./core
    ./plugins
  ];
}
