-- set meta
vim.o.term = "xterm-256color"
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
vim.opt.termguicolors = true

-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_noslient = { noremap = true }
local bufopts = { noremap = true, silent = true }

keymap("n", "<C-t>", ":NERDTreeToggle<CR>", opts)
keymap("v", "<space>qf", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)

-- set plugins
require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("wojciechkepka/vim-github-dark")
	use("luochen1990/rainbow")
	use("jose-elias-alvarez/null-ls.nvim")
	use("preservim/nerdtree")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("neovim/nvim-lspconfig")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" } },
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
end)

-- setup null-ls
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.autopep8,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.completion.spell,
	},
})

-- set lsp
require("lspconfig").pyright.setup({})

-- set treesitter
require("nvim-treesitter.configs").setup({
	auto_install = true,
	ensure_installed = { "python", "lua", "typescript" },
	ignore_install = { "javascript" },
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = true,
	},
})

-- set nvim-autopairs
-- TODO set fast_wrap
local npairs = require("nvim-autopairs")
npairs.setup({
	fast_wrap = {
		map = "<A-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})
npairs.enable()

-- set gitsigns
require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 500,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

-- set details
vim.g.rainbow_active = 1
vim.cmd("colorscheme ghdark")
vim.cmd("hi SpellBad gui=undercurl  ctermbg=None cterm=undercurl guifg=#264348")
vim.cmd("hi GitSignsCurrentLineBlame guifg=#123123")
vim.g.airline_theme = "tomorrow"

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		-- vim.opts.foldmethod     = 'expr'
		-- vim.opts.foldexpr       = 'nvim_treesitter#foldexpr()'
	end,
})
