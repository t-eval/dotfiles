{...}: {
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
        "<leader>ci" = "implementation";
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
      clangd = {
        enable = true;
        package = null;
      };
      zls = {
        enable = true;
        package = null;
        settings = {
          zls = {
            enable_build_on_save = true;
          };
        };
      };
    };
  };
}
