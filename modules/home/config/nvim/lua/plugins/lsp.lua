return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp = require("lspconfig")

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

		for name, config in pairs(servers) do
			lsp[name].setup(config)
		end
	end,
}
