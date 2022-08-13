-- set meta
vim.o.term = 'xterm-256color'
vim.o.relativenumber = true
vim.o.number = true
vim.o.autoindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2 
vim.expandtab = true

-- set key bindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true } 

keymap('n','<C-t>', ':NERDTreeToggle<CR>', opts)
keymap('v', '\\qf', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
	
end)

-- set lsp
require'lspconfig'.pyright.setup{}

-- set treesitter
require'nvim-treesitter.configs'.setup {
  auto_install = true,
  ensure_installed = { "python", "lua", "typescript" },
  ignore_install = { "javascript" },
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = true,
  },
}

-- set nvim-autopairs
-- TODO 
local npairs = require("nvim-autopairs")
npairs.setup({
    fast_wrap = {
      map = '<A-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})
npairs.enable()

-- set details
vim.g.rainbow_active = 1 
vim.cmd "colorscheme ghdark"
vim.g.airline_theme = 'tomorrow'

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    -- vim.opt.foldmethod     = 'expr'
    -- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
