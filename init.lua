vim.o.term = 'xterm'
vim.o.t_co = 256 
vim.o.relativenumber = true
vim.o.number = true
vim.bo.autoindent = true
vim.bo.shiftwidth = 2
vim.expandtab = true

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap('n','<C-t>', ':NERDTreeToggle<CR>', opts)

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'wojciechkepka/vim-github-dark'
  use 'luochen1990/rainbow'
  use 'preservim/nerdtree'
end)

vim.g.rainbow_active = 1 

vim.cmd "colorscheme ghdark"

