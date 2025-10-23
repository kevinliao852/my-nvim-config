return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
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
		require("nvim-autopairs").enable()
	end,
}
