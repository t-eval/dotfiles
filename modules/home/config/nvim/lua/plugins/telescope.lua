return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>fw", builtin.live_grep, desc = "Live Grep" },
			{ "<leader>fd", builtin.find_files, desc = "Find files" },
			{ "<leader>fg", builtin.git_files, desc = "Find git files" },
			{ "<leader>fb", builtin.git_branches, desc = "Find git branches" },
		}
	end,
	config = function()
		local default_opt = { theme = "ivy", disable_devicons = true }

		require("telescope").setup({
			pickers = {
				find_files = default_opt,
				git_files = default_opt,
				live_grep = default_opt,
				lsp_references = default_opt,
			},
			extensions = {
				fzf = {
					fuzzy = true,
					case_mode = "smart_case",
				},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
