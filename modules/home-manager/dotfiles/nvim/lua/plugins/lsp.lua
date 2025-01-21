return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lsp = require("lspconfig")

    local servers = {
      nixd = {
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
          },
        },
      },
      yamlls = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              library = { vim.env.VIMRUNTIME },
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      zls = {
        settings = {
          zls = {
            enable_build_on_save = true,
          },
        },
      },
      ccls = {},
      hls = {
        filetypes = { "haskell", "cabal" },
      },
      glsl_analyzer = {},

      -- Typescript development
      denols = {
        root_dir = lsp.util.root_pattern({ "deno.json" }),
      },
      ts_ls = {
        root_dir = lsp.util.root_pattern({ "package.json", "tsconfig.json" }),
      },
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Telescope/LSP keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, bufopts)
      vim.keymap.set("n", "<leader>gr", builtin.lsp_references, bufopts)

      -- LSP keymaps
      vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, bufopts)
    end

    vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

    for name, config in pairs(servers) do
      local lsp_config = vim.tbl_deep_extend(
        "force",
        config,
        { capabilities = capabilities, on_attach = on_attach }
      )

      lsp[name].setup(lsp_config)
    end
  end,
}
