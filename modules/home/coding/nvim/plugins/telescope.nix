{...}: let
  common_picker = {
    theme = "ivy";
    disable_devicons = true;
  };
in {
  programs.nixvim.plugins = {
    web-devicons.enable = false;

    telescope = {
      enable = true;
      autoLoad = true;

      keymaps = {
        "<leader>fw" = "live_grep";
        "<leader>fd" = "find_files";
        "<leader>fg" = "git_files";
        "<leader>fb" = "git_branches";
      };

      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            fuzzy = true;
            case_mode = "smart_case";
          };
        };
      };

      settings = {
        pickers = {
          find_files = common_picker;
          git_files = common_picker;
          live_grep = common_picker;
          lsp_references = common_picker;
          diagnostics = common_picker;
        };
      };
    };
  };
}
