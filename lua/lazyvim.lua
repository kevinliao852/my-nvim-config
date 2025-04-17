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
		tag = "0.1.4",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
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
		version = "v0.9.2",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
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
	{ "mfussenegger/nvim-dap-python" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"leoluz/nvim-dap-go",
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
				-- your neotest config here
				adapters = {
					require("neotest-go"), -- Registration
					require("neotest-python"),
				},
			})
		end,
	},
	{ "kevinliao852/nvim-folding" },
	{ "folke/zen-mode.nvim" },
	{ "junegunn/vim-easy-align" },
	{ "hedyhli/outline.nvim" },
	--{
	--	"yetone/avante.nvim",
	--	event = "VeryLazy",
	--	lazy = false,
	--	version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
	--	opts = {
	--		-- add any opts here
	--	},
	--	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	--	build = "make",
	--	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	--	dependencies = {
	--		"stevearc/dressing.nvim",
	--		"nvim-lua/plenary.nvim",
	--		"MunifTanjim/nui.nvim",
	--		--- The below dependencies are optional,
	--		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
	--		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
	--		"zbirenbaum/copilot.lua", -- for providers='copilot'
	--		{
	--			-- support for image pasting
	--			"HakonHarnes/img-clip.nvim",
	--			event = "VeryLazy",
	--			opts = {
	--				-- recommended settings
	--				default = {
	--					embed_image_as_base64 = false,
	--					prompt_for_file_name = false,
	--					drag_and_drop = {
	--						insert_mode = true,
	--					},
	--					-- required for Windows users
	--					use_absolute_path = true,
	--				},
	--			},
	--		},
	--		{
	--			-- Make sure to set this up properly if you have lazy=true
	--			"MeanderingProgrammer/render-markdown.nvim",
	--			opts = {
	--				file_types = { "markdown", "Avante" },
	--			},
	--			ft = { "markdown", "Avante" },
	--		},
	--	},
	--	opts = {
	--		provider = "ollama",
	--		vendors = {
	--			---@type AvanteProvider
	--			ollama = {
	--				endpoint = "http://localhost:11434/v1",
	--				model = "llama3.2",
	--				parse_curl_args = function(opts, code_opts)
	--					return {
	--						url = opts.endpoint .. "/chat/completions",
	--						headers = {
	--							["Accept"] = "application/json",
	--							["Content-Type"] = "application/json",
	--						},
	--						body = {
	--							model = opts.model,
	--							max_tokens = 2048,
	--							messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
	--							stream = true,
	--						},
	--					}
	--				end,
	--				parse_response_data = function(data_stream, event_state, opts)
	--					require("avante.providers").openai.parse_response(data_stream, event_state, opts)
	--				end,
	--			},
	--		},
	--	},
	--},
})
