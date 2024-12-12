return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/nvim-cmp",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
	},
	config = function()
		local lsp = require("lspconfig")
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-p>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Insert,
				}),
				["<C-y>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					{ "i", "c" }
				),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			}),
		})

		local servers = {
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
		}

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		for name, config in pairs(servers) do
			local lsp_config =
				vim.tbl_deep_extend("force", config, { capabilities = capabilities })

			lsp[name].setup(lsp_config)
		end
	end,
}
