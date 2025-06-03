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

      colorschemes = {
        gruvbox = {
          enable = true;
          settings = {
            terminal_colors = true;
            transparent_mode = true;
          };
        };
      };
    };
  };

  imports = [
    ./core
    ./plugins
  ];
}
