{...}: let
  defaultNull = {
    enable = false;
    package = null;
  };
in {
  programs.nixvim.plugins.lsp = {
    enable = true;
    autoLoad = true;

    keymaps = {
      lspBuf = {
        "<leader>K" = "hover";
        "<leader>cr" = "rename";
        "<leader>ca" = "code_action";
        "<leader>ct" = "type_definition";
        "<leader>cd" = "definition";
      };
      silent = true;
    };

    servers = {
      nixd = {
        enable = true;
        settings = {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
        };
      };
      clangd = defaultNull;
      zls = {
        enable = true;
        package = null;
        settings = {
          zls = {
            enable_build_on_save = true;
          };
        };
      };
      ts_ls = {
        enable = false;
        package = null;
      };

      # IAC
      terraformls = {
        enable = true;
        package = null;
      };

      # Web
      volar = {
        enable = true;
        package = null;
        settings = {
          filetypes = ["vue" "typescript" "javascript"];
        };
      };
    };
  };
}
