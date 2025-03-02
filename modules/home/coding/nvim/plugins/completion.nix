{...}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoLoad = true;
      autoEnableSources = false;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
        ];

        mapping = {
          "<C-n>" = ''
            cmp.mapping.select_next_item({
              behavior = cmp.SelectBehavior.Insert,
            })
          '';

          "<C-p>" = ''
            cmp.mapping.select_prev_item({
              behavior = cmp.SelectBehavior.Insert,
            })
          '';

          "<C-y>" = ''
            cmp.mapping(
              cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              }),
              { "i", "c" }
            )
          '';
        };

        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
  };
}
