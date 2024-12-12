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
		}
	end,
	config = function()
		require("telescope").setup({
			defaults = {
				theme = "ivy",
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
