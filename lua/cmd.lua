-- set meta
vim.g.loaded = 1
vim.diagnostic.config({
	virtual_text = {
		update_in_insert = true,
	},
})
-- vim.g.loaded_netrwPlugin = 1
-- vim.o.term = "xterm-256color"
vim.o.relativenumber = true
vim.o.number = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.expandtab = true
vim.o.cursorline = true
vim.o.spell = true
vim.g.mapleader = ";"
vim.g.undotree_WindowLayout = 4
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.g.rainbow_active = 1
vim.opt.colorcolumn = "80"

-- set details
vim.cmd("set scrolloff=2")
vim.cmd("hi GitSignsCurrentLineBlame guifg=#456456")
vim.cmd("set encoding=utf-8")
vim.cmd("set nocompatible")
vim.cmd("set encoding")
-- vim.cmd("autocmd BufRead * Gitsigns toggle_current_line_blame true")

-- window resize, using arrow keys
vim.cmd("nnoremap <silent> <Up>    :<C-u>resize -2<CR>")
vim.cmd("nnoremap <silent> <Down>  :<C-u>resize +2<CR>")
vim.cmd("nnoremap <silent> <Left>  :<C-u>vertical resize -4<CR>")
vim.cmd("nnoremap <silent> <Right> :<C-u>vertical resize +4<CR>")
vim.g.python3_host_prog = "/usr/local/bin/python3"

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		-- vim.opts.foldmethod     = 'expr'
		-- vim.opts.foldexpr       = 'nvim_treesitter#foldexpr()'
	end,
})

-- write & quit
vim.cmd([[
cnoreabbrev Wq wq
cnoreabbrev WQ wq
]])

-- quit all
vim.cmd([[
cnoreabbrev Qa qa
cnoreabbrev QA qa
]])

-- write & quit all
vim.cmd([[
cnoreabbrev Wqa wqa
cnoreabbrev WQa wqa
]])

-- set spell check
vim.cmd("set spelloptions=camel")
vim.opt.spelllang = vim.opt.spelllang + { "cjk" }
-- vim.cmd("hi SpellBad gui=undercurl  ctermbg=None cterm=undercurl guifg=#96be25")
--

-- Define the space sign
vim.cmd([[
sign define SpaceSign text=\  texthl=NONE
]])

-- Function to place the space sign for all lines in a buffer
local function place_space_signs(bufnr)
	local line_count = vim.api.nvim_buf_line_count(bufnr)
	for i = 1, line_count do
		vim.cmd(string.format("sign place %d line=%d name=SpaceSign buffer=%d", i, i, bufnr))
	end
end

-- Autocommand to load the space sign in every buffer
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		local bufnr = args.buf
		place_space_signs(bufnr)
	end,
})
