return {
	{ "itchyny/vim-cursorword" },
	{ "vim-ctrlspace/vim-ctrlspace" },
	{ "easymotion/vim-easymotion" },
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup()
		end,
	},
	{ "ThePrimeagen/harpoon" },
}
