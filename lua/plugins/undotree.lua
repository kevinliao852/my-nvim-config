return {
	"mbbill/undotree",
	lazy = true,
	cmd = "UndotreeToggle",
	config = function()
		local CACHE_DIR = vim.env.HOME .. "/.cache/nvim"

		if vim.fn.has("persistent_undo") then
			vim.opt.undodir = CACHE_DIR .. "/undofiles/"
			vim.opt.undofile = true
		end
	end,
}
