require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
})