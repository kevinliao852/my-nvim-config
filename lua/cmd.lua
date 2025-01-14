-- set details
vim.cmd("set scrolloff=2")
vim.cmd("colorscheme kanagawa-wave")
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
