local status_ok, nullls = pcall(require, "null-ls")

if not status_ok then
	return
end

nullls.setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.sql_formatter,
		require("null-ls").builtins.formatting.black.with({
			extra_args = { "-S" },
		}),
		require("null-ls").builtins.formatting.gofmt,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.code_actions.eslint,
		require("null-ls").builtins.diagnostics.pylint,
		require("null-ls").builtins.diagnostics.golangci_lint,
		require("null-ls").builtins.completion.spell,
	},
})
