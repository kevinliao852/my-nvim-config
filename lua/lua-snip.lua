local status_ok, lua_snip = pcall(require, "luasnip")
if not status_ok then
	return
end

-- require("luasnip.loaders.from_vscode").lazy_load()

require("luasnip.loaders.from_vscode").load()

-- set for javascript & typescript

lua_snip.filetype_extend("typescript", { "javascript" })
