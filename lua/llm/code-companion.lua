return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codecompanion").setup({
			extensions = {
				-- mcphub = {
				-- 	callback = "mcphub.extensions.codecompanion",
				-- 	opts = {
				-- 		show_result_in_chat = true, -- Show mcp tool results in chat
				-- 		make_vars = true, -- Convert resources to #variables
				-- 		make_slash_commands = true, -- Add prompts as /slash commands
				-- 	},
				-- },
			},
			strategies = {
				chat = {
					adapter = "openai",
				},
				inline = {
					adapter = "anthropic",
				},
				cmd = {
					adapter = "deepseek",
				},
			},
			http = {
				adapters = {
					-- llama3 = function()
					-- 	return require("codecompanion.adapters").extend("ollama", {
					-- 		name = "llama3",
					-- 		schema = {
					-- 			model = {
					-- 				default = "gpt-oss:latest",
					-- 			},
					-- 			num_ctx = {
					-- 				default = 16384,
					-- 			},
					-- 			num_predict = {
					-- 				default = -1,
					-- 			},
					-- 		},
					-- 	})
					-- end,
				},
			},
		})
	end,
}
