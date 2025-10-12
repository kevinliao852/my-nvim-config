local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to
	install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- require("nvim-treesitter.configs").setup({
-- 	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },
-- 	sync_install = false,
-- 	auto_install = true,
-- 	ignore_install = { "javascript" },
-- 	highlight = {
-- 		enable = true,
-- 		disable = function(lang, buf)
-- 			local max_filesize = 100 * 1024 -- 100 KB
-- 			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
-- 			if ok and stats and stats.size > max_filesize then
-- 				return true
-- 			end
-- 		end,
-- 		additional_vim_regex_highlighting = false,
-- 	},
-- })

-- treesitter_config.setup({
-- 	auto_install = true,
-- 	ensure_installed = { "python", "lua", "typescript", "javascript" },
-- 	-- ignore_install = { "javascript" },
-- 	sync_install = false,
-- 	highlight = {
-- 	enable = true,
-- 	disable = { "c", "rust" },
-- 	additional_vim_regex_highlighting = true,
-- 	},
-- })

-- require("treesitter-context").setup({
-- 	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
-- 	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
-- 	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
-- 	line_numbers = true,
-- 	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
-- 	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
-- 	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
-- 	-- Separator between context and content. Should be a single character string, like '-'.
-- 	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
-- 	separator = nil,
-- 	zindex = 20, -- The Z-index of the context window
-- 	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
-- })
