-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_noslient = { noremap = true }

-- Vim Basic

keymap("n", "<leader>11", ":Copilot panel<CR>", opts)
keymap("n", "<leader>c", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("i", "<C-l>", "<Esc>", opts)
keymap("v", "<C-l>", "<Esc>", opts)
keymap("n", "<Esc><Esc>", ":noh<CR>", opts)
keymap("n", "<space>[", ":bprev<CR>", opts)
keymap("n", "<space>]", ":bnext<CR>", opts)
keymap("n", "<leader>q", ":bd<CR>", opts)

-- Gitsigns

keymap("n", "<space>gd", ":Gitsigns diffthis HEAD~1<CR>", opts)
keymap("n", "<space>gk", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<space>gj", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<space>gs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<space>gu", ":Gitsigns undo_stage_hunk<CR>", opts)

-- Undotree

keymap("n", "U", ":UndotreeToggle<CR>", opts)

-- Telescope

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("v", "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)

-- Harpoon

keymap("n", "<space>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<space>at", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<space>aw", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<space>as", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)

-- Lspsaga

keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "zo", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- keymap("n", "zo", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

-- Neotree
keymap("n", "<C-t>", "<cmd>Neotree toggle<cr>", opts)
keymap("n", "<leader><C-t>", "<cmd>Neotree toggle source=buffers float<cr>", opts)

-- Lsp
keymap("v", "<space>qf", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
vim.keymap.set("n", "zj", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "zk", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<space>f", function()
	vim.lsp.buf.format({ async = true })
end, opts)
vim.keymap.set({ "n", "v" }, "zi", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)

-- Context

keymap("n", "<space>`", ":TSContext toggle<cr>", opts)

-- SymbolsOutline

keymap("n", "<space><Tab>", "<cmd>Outline<cr>", opts)

-- Fugitive

keymap("n", "<leader>g", ":G<cr>", opts)

-- Vim View Split

keymap("n", "<leader>h", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>j", "<cmd>split<Bar>wincmd j<CR>", opts)
keymap("n", "<leader>k", "<cmd>split<CR>", opts)
keymap("n", "<leader>l", "<cmd>vsplit<Bar>wincmd l<CR>", opts)

-- For GPT
keymap("n", "<leader>i", ":ChatGPT<CR>", opts)

-- For DAP
vim.api.nvim_set_keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>do", ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require'dapui'.toggle()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dw", "<cmd>DapVirtualTextToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dq", ":lua require'dap'.terminate()<CR>", opts)
vim.keymap.set("n", "<Leader>dk", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")

	widgets.centered_float(widgets.scopes)
end)

-- For copilot
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})

-- nvvim-folding
vim.api.nvim_set_keymap("n", "<leader>zf", ":lua require('nvim-folding').choose_folding_method()<CR>", opts)

-- easy align
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", opts_noslient)
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", opts_noslient)

-- neotest
vim.keymap.set("n", "<leader>tn", function()
	require("neotest").run.run()
end, { desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tt", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run test file" })

vim.keymap.set("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })

vim.keymap.set("n", "<leader>ts", function()
	require("neotest").run.stop()
end, { desc = "Stop nearest test" })

vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.attach()
end, { desc = "Attach to nearest test" })

vim.keymap.set("n", "<leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "Open test output" })

vim.keymap.set("n", "<leader>tp", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle test output panel" })

-- legacy
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { noremap = true, silent = true, desc = "Start/Continue Debugging" })

vim.keymap.set("n", "<F9>", function()
	require("dap").toggle_breakpoint()
end, { noremap = true, silent = true, desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { noremap = true, silent = true, desc = "Step Over" })

vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { noremap = true, silent = true, desc = "Step Into" })

-- codecompanion
vim.keymap.set("n", "<leader>ag", ":CodeCompanionChat<CR>", { desc = "Code Companion" })
vim.keymap.set("n", "<leader>ah", ":CodeCompanionActions<CR>", { desc = "Code Companion Actions" })

-- turn off all buffers
keymap("n", "<leader><leader>b", ":bufdo bwipeout<CR>", opts)

-- inlay hints
keymap("n", "<leader>xz", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", opts)
