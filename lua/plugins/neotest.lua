return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"leoluz/nvim-dap-go",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
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
				log_level = vim.log.levels.DEBUG,
				adapters = {
					require("neotest-python"),
					require("neotest-golang"),
					-- require("neotest-plenary"),
					-- require("neotest-vim-test")({
					-- 	ignore_file_types = { "python", "vim", "lua" },
					-- }),
				},
			})
		end,
	},
}
