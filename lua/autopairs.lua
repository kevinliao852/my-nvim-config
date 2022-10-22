local status_ok, npairs = pcall(require, "nvim-autopairs")

if not status_ok then
	return
end

require("nvim-autopairs").setup({})

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
