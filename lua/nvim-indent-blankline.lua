-- vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1F1F28 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guibg=#2A2A37 gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("tab:··")
-- vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup({
-- 	char = "",
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 	},
-- 	space_char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 	},
-- 	show_trailing_blankline_indent = false,
-- })

require("ibl").setup({
	debounce = 100,
	indent = { tab_char = { "▎", "·" } },
})
