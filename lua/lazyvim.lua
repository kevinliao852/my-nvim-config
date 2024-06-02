local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- file tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
	},
	{ "mbbill/undotree" },
	{ "ThePrimeagen/harpoon" },
	-- lsp related
	{ "neovim/nvim-lspconfig" },
	{ "tami5/lspsaga.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		"BurntSushi/ripgrep", -- for live_grep
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- view
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "simrat39/symbols-outline.nvim" },
	{ "vim-airline/vim-airline" },
	{ "vim-airline/vim-airline-themes" },
	{ "luochen1990/rainbow" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" },
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	},
	-- completion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "petertriho/nvim-scrollbar" },
	{ "github/copilot.vim" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
			"kevinliao852/fastapi-snippet",
		},
	},
	-- action
	{ "itchyny/vim-cursorword" },
	{ "windwp/nvim-autopairs" },
	{ "terryma/vim-multiple-cursors" },
	{ "vim-ctrlspace/vim-ctrlspace" },
	{ "easymotion/vim-easymotion" },
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- {
	-- 	"tpope/vim-dadbod",
	-- 	requires = {
	-- 		"kristijanhusak/vim-dadbod-ui",
	-- 		"kristijanhusak/vim-dadbod-completion",
	-- 	},
	-- 	config = function()
	-- 		require("config.dadbod").setup({})
	-- 	end,
	-- },
	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
})
