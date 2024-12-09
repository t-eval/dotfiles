{ ... }: {

  programs.nixvim = {

    extraConfigLuaPost = ''
      vim.diagnostic.config({ virtual_text = false })
    '';

    plugins.lsp = {
      enable = true;
      keymaps = {
        silent = true;
        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "<leader>ca" = "code_action";
          "<leader>r" = "rename";
          "<leader>rr" = "references";
        };

        diagnostic = {
          "[d" = "goto_next";
          "]d" = "goto_prev";
          "<leader>e" = "open_float";
        };
      };

      servers = {
        # Always have
        nil_ls.enable = true;
        yamlls.enable = true;

        # Use with nix develop
        clangd = {
          enable = true;
          package = null;
          cmd = [
            "clangd"
            "--background-index"
            "--limit-results=500"
            "--completion-style=detailed"
            "--log=verbose"
          ];
        };
        gopls = {
          enable = true;
          package = null;
        };
        hls = {
          enable = true;
          package = null;
          installGhc = false;
          filetypes = [ "haskell" "cabal" ];
        };
        metals = {
          enable = true;
          filetypes = [ "scala" "sbt" ];
          package = null;
        };
        zls = {
          enable = true;
          package = null;
          settings = { build_on_save = true; };
        };
        rust_analyzer = {
          enable = true;
          package = null;
          installCargo = false;
          installRustc = false;
        };
        jsonls = {
          enable = true;
          package = null;
        };
      };
    };
  };
}
