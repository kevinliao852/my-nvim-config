return {
	"j-hui/fidget.nvim",
	config = function()
		require("utils.fidget-ext").init({})
		require("fidget").setup()
	end,
}
