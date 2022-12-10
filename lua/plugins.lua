require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("terryma/vim-multiple-cursors")
	use("onsails/lspkind.nvim")
	use("folke/tokyonight.nvim")
	use("vim-ctrlspace/vim-ctrlspace")
	use("tami5/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("mbbill/undotree")
	use("petertriho/nvim-scrollbar")
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
	use("windwp/nvim-autopairs")
	use("BurntSushi/ripgrep")
	use("kyazdani42/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
	})
	use("lewis6991/gitsigns.nvim")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = "muniftanjim/nui.nvim",
	})
end)
