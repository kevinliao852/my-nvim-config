return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep", -- for live_grep
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			vimgrep_arguments = {
				"rg",
				"--line-number",
				"--column",
				"--smart-case",
			},
		})
		-- Keybindings
	end,
}
