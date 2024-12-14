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
				{ name = "luasnip" },
				{ name = "buffer", keyword_length = 4 },
			}),
		})

		local servers = {
			nil_ls = {},
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
			hls = {
				filetypes = { "haskell", "cabal" },
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
