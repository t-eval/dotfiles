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
      enable = mkEnableOption "neovim";

      settings = mkOption {
        default = {};
        type = submodule {
          options = {
            lsp = mkOption {
              type = listOf package;
              default = [];
              description = "Language servers to install for neovim";
            };

            formatters = mkOption {
              type = listOf package;
              default = [];
              description = "Formatters to install for neovim";
            };
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    # Language servers, formatters
    home.packages = with pkgs;
      [
        # Tools
        ripgrep

        # Lua
        lua-language-server
        stylua
        lua
        luajitPackages.luarocks

        # Nix
        nixd
        alejandra
      ]
      ++ cfg.settings.lsp
      ++ cfg.settings.formatters;

    xdg.configFile."nvim" = {
      recursive = true;
      source = ../dotfiles/nvim;
    };
  };
}
