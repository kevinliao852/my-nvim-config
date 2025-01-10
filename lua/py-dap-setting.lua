local status_ok, dap = pcall(require, "dap")

if not status_ok then
	return
end

local status_ok, dapui = pcall(require, "dapui")

if not status_ok then
	return
end

dapui.setup(
	{
		controls = {
			element = "repl",
			enabled = false,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = { {
			elements = { {
				id = "scopes",
				size = 0.20
			}, {
				id = "breakpoints",
				size = 0.20
			}, {
				id = "stacks",
				size = 0.20
			}, {
				id = "watches",
				size = 0.20
			} },
			position = "right",
			size = 80
		}, },
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	}
)


require("dap-python").setup("python3")


dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}
