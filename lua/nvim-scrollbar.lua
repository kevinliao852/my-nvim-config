local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
	handle = {
		color = colors.bg_highlight,
	},
	marks = {
		Cursor = { text = "" },
		Error = { color = colors.error },
		Hint = { color = colors.hint },
		Info = { color = colors.info },
		Misc = { color = colors.purple },
		Search = { color = colors.orange },
		Warn = { color = colors.warning },
	},
})
