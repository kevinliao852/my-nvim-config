require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("terryma/vim-multiple-cursors")
	use("onsails/lspkind.nvim")
	use("folke/tokyonight.nvim")
	use("vim-ctrlspace/vim-ctrlspace")
	use("tami5/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("mbbill/undotree")
	use("wellle/context.vim")
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
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
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
	use("lewis6991/gitsigns.nvim")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"muniftanjim/nui.nvim",
		},
	})
end)
