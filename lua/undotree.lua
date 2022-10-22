local status_ok, undo = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

local CACHE_DIR = vim.env.HOME .. "/.cache/nvim"

if vim.fn.has("persistent_undo") then
	vim.opt.undodir = CACHE_DIR .. "/undofiles/"
	vim.opt.undofile = true
end
