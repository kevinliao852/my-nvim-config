return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codecompanion").setup({
			prompt_library = {
				["Simple Explain"] = {
					interaction = "inline",
					description = "Explain selected code in plain language",
					opts = {
						alias = "simple-explain",
						auto_submit = true,
						is_slash_cmd = false,
						index = 2,
						modes = { "v" },
						stop_context_insertion = true,
					},
					prompts = {
						{
							role = "system",
							content = "Explain the selected code clearly and concisely in plain language. Focus on what it does, how it works, and any important behavior or edge cases. Avoid jargon unless it is necessary.",
						},
						{
							role = "user",
							content = function(context)
								return "Please explain this code from buffer "
									.. context.bufnr
									.. ":\n\n```"
									.. context.filetype
									.. "\n"
									.. context.code
									.. "\n```"
							end,
						},
					},
				},
				["Text Diagram Explain"] = {
					interaction = "chat",
					description = "Explain typed text with a text diagram",
					opts = {
						alias = "text-diagram",
						auto_submit = true,
						is_slash_cmd = true,
						index = 3,
						adapter = {
							name = "codex",
						},
						user_prompt = true,
						stop_context_insertion = true,
					},
					prompts = {
						{
							role = "system",
							content = "Explain the user's text using a clear text diagram first, then a concise explanation. Use plain ASCII characters only. Show the flow, key data structures, or control paths when helpful. Keep the diagram simple and easy to scan.",
						},
					},
				},
			},
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
					adapter = "openai",
				},
				cmd = {
					adapter = "openai",
				},
			},
			adapters = {
				acp = {
					codex = function()
						return require("codecompanion.adapters").extend("codex", {
							defaults = {
								auth_method = "chatgpt", -- "openai-api-key"|"codex-api-key"|"chatgpt"
							},
						})
					end,
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
