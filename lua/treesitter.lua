local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter_config.setup({
	auto_install = true,
	ensure_installed = { "python", "lua", "typescript", "javascript" },
	-- ignore_install = { "javascript" },
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = true,
	},
})
