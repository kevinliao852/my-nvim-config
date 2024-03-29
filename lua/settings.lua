-- set meta
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.o.term = "xterm-256color"
vim.o.relativenumber = true
vim.o.number = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.expandtab = true
vim.o.cursorline = true
vim.o.spell = true
vim.g.mapleader = ";"
vim.g.undotree_WindowLayout = 4
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.g.rainbow_active = 1

-- airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#show_buffers"] = 1
vim.g["airline#extensions#tabline#show_close_button"] = 0
vim.g["airline#extensions#tabline#show_tabs"] = 1
vim.g["airline#extensions#ctrlspace#enabled"] = 1

-- buffer name formmatter
vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"
vim.g["airline#extensions#tabline#fnamemod"] = ":t"
vim.g["airline#extensions#tabline#fnamecollapse"] = 0
vim.g["airline#extensions#tabline#fnametruncate"] = 12

-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local opts_noslient = { noremap = true }
local bufopts = { noremap = true, silent = true }

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

-- Nerdtree

keymap("n", "<leader>tt", ":NERDTreeToggle<CR>", opts)

-- Lsp

keymap("v", "<space>qf", "<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
vim.keymap.set("n", "zj", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "zk", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
vim.keymap.set("n", "<space>f", function()
	vim.lsp.buf.format({ async = true })
end, bufopts)
vim.keymap.set("n", "zi", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)

-- Context

keymap("n", "<space>`", ":TSContextToggle<cr>", opts)

-- SymbolsOutline

keymap("n", "<space><Tab>", ":SymbolsOutline<cr>", opts)

-- Fugitive

keymap("n", "<leader>g", ":G<cr>", opts)

-- Vim View Split

keymap("n", "<leader>h", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>j", "<cmd>split<Bar>wincmd j<CR>", opts)
keymap("n", "<leader>k", "<cmd>split<CR>", opts)
keymap("n", "<leader>l", "<cmd>vsplit<Bar>wincmd l<CR>", opts)

-- For GPT
keymap("n", "<leader>i", ":ChatGPT<CR>", opts)

-- legacy

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- keymap("n", "zo", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
