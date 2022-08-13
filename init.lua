-- set meta
vim.o.term = 'xterm-256color'
vim.o.relativenumber = true
vim.o.number = true
vim.bo.autoindent = true
vim.bo.shiftwidth = 2
vim.expandtab = true

-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap('n','<C-t>', ':NERDTreeToggle<CR>', opts)

-- set plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'wojciechkepka/vim-github-dark'
  use 'luochen1990/rainbow'
  use 'preservim/nerdtree'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'neovim/nvim-lspconfig'
end)

-- set lsp
require'lspconfig'.pyright.setup{}

-- set details
vim.g.rainbow_active = 1 
vim.cmd "colorscheme ghdark"
vim.g.airline_theme = 'tomorrow'


