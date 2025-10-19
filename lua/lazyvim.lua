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
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{ "mbbill/undotree" },
	{ "ThePrimeagen/harpoon" },
	-- lsp related
	{ "neovim/nvim-lspconfig" },
	{ "nvimdev/lspsaga.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "mfussenegger/nvim-jdtls" },
	{ "nvimtools/none-ls.nvim" },
	-- treesitter
	{ "BurntSushi/ripgrep" }, -- for live_grep
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- view
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{ "luochen1990/rainbow" },
	{ "kyazdani42/nvim-web-devicons" },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},
	-- completion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "petertriho/nvim-scrollbar" },
	{ "github/copilot.vim" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"kevinliao852/fastapi-snippet",
		},
		version = "v2.*",
		build = "make install_jsregexp",
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
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "mfussenegger/nvim-dap" },
	{ "leoluz/nvim-dap-go" },
	{ "mfussenegger/nvim-dap-python" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"leoluz/nvim-dap-go",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {

					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				log_level = vim.log.levels.DEBUG,
				adapters = {
					require("neotest-python"),
					require("neotest-golang"),
					-- require("neotest-plenary"),
					-- require("neotest-vim-test")({
					-- 	ignore_file_types = { "python", "vim", "lua" },
					-- }),
				},
			})
		end,
	},
	{ "kevinliao852/nvim-folding" },
	{ "folke/zen-mode.nvim" },
	{ "junegunn/vim-easy-align" },
	{ "hedyhli/outline.nvim" },
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
		config = function()
			require("fidget-config").init({})
			require("fidget").setup()
		end,
	},
	require("llm.avante"),
	require("llm.mcphub"),
	require("llm.code-companion"),
	require("llm.sidek"),
})
