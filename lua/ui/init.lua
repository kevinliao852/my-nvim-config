return {
	{ "rebelot/kanagawa.nvim" },
	{ "luochen1990/rainbow" },
	-- lua/plugins/rose-pine.lua
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
