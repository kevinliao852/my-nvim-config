return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("tab:··")

			require("ibl").setup({
				debounce = 100,
				indent = { tab_char = { "▎", "·" } },
			})
		end,
	},
}
