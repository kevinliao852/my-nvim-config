-- set meta
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
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
vim.g.undotree_WindowLayout = 4
vim.opt.termguicolors = true

-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_noslient = { noremap = true }
local bufopts = { noremap = true, silent = true }

keymap("n", "<leader>c", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("i", "<C-l>", "<Esc>", opts)
keymap("v", "<C-l>", "<Esc>", opts)
keymap("n", "<Esc><Esc>", ":noh<CR>", opts)

keymap("n", "U", ":UndotreeToggle<CR>", opts)
keymap("n", "<leader>tt", ":NERDTreeToggle<CR>", opts)
keymap("n", "<C-t>", ":NeoTreeFocusToggle<CR>", opts)
keymap("v", "<space>qf", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "zo", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "<space>gd", ":Gitsigns diffthis HEAD~1<CR>", opts)
keymap("n", "<space>gk", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<space>gj", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<space>gs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<space>gu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "zj", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", opts)
keymap("n", "zk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
keymap("v", "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
keymap("n", "<space>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<space>at", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<space>aw", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<space>as", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "<space>`", ":ContextToggle<cr>", opts)
keymap("n", "<space><Tab>", ":SymbolsOutline<cr>", opts)
keymap("n", "<leader>g", ":G<cr>", opts)

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
	use("folke/tokyonight.nvim")
	use("vim-ctrlspace/vim-ctrlspace")
	use("tami5/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("wbthomason/packer.nvim")
	use("mbbill/undotree")
	use("wellle/context.vim")
	use("wojciechkepka/vim-github-dark")
	use("luochen1990/rainbow")
	use("jose-elias-alvarez/null-ls.nvim")
	use("preservim/nerdtree")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("easymotion/vim-easymotion")
	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	-- use("nvim-treesitter/nvim-treesitter-context")
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
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
end)

-- setup null-ls
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.diagnostics.golangci_lint,
		require("null-ls").builtins.completion.spell,
	},
})

-- set lsp
require("lspconfig").pyright.setup({})
require("lspconfig").tailwindcss.setup({})

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

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver", "gopls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
		handlers = {
			["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
				-- tailwindcss lang server waits for this repsonse before providing hover
				vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
			end,
		},
	})
end

require("lspconfig").tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

require("lspconfig").gopls.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})

-- undo settings

local CACHE_DIR = vim.env.HOME .. "/.cache/nvim"

if vim.fn.has("persistent_undo") then
	vim.opt.undodir = CACHE_DIR .. "/undofiles/"
	vim.opt.undofile = true
end

-- setup icons
require("nvim-web-devicons").get_icons(filename, extension, { default = true })
require("nvim-web-devicons").has_loaded()
local opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = nil,
	auto_unfold_hover = true,
	fold_markers = { "", "" },
	wrap = false,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSMethod" },
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "𝓐", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" },
	},
}

require("symbols-outline").setup(opts)

-- set details
vim.g.rainbow_active = 1
vim.cmd("colorscheme tokyonight-night")
vim.cmd("hi SpellBad gui=undercurl  ctermbg=None cterm=undercurl guifg=#96be25")
vim.cmd("hi GitSignsCurrentLineBlame guifg=#456456")
vim.cmd("set encoding=utf-8")
vim.cmd("set nocompatible")
vim.cmd("set encoding")

-- window resize, using arrow keys
vim.cmd("nnoremap <silent> <Up>    :<C-u>resize -2<CR>")
vim.cmd("nnoremap <silent> <Down>  :<C-u>resize +2<CR>")
vim.cmd("nnoremap <silent> <Left>  :<C-u>vertical resize -4<CR>")
vim.cmd("nnoremap <silent> <Right> :<C-u>vertical resize +4<CR>")
vim.g.airline_theme = "tomorrow"
vim.g.python3_host_prog = "/usr/local/bin/python3"

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		-- vim.opts.foldmethod     = 'expr'
		-- vim.opts.foldexpr       = 'nvim_treesitter#foldexpr()'
	end,
})

-- lspsaga
local lspsaga = require("lspsaga")

lspsaga.setup({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",
	code_action_icon = " ",
	border_style = "round",
})

-- ======== Commands ========
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
