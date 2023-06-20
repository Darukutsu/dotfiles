require('plugins')
require('keymap')
require('theme')
require('plug/mason')
require('plug/treesitter')
--require('plug/dap') -- not needed to setup if using mason
require('plug/dapui')
require('plug/telescope')
require('plug/coq')
--require('plug/hologram')
--require('plug/linter')
--require('plug/undotree')
require('plug/readline')
require('plug/indent-blank')
require('plug/which-key')
require('plug/ccc')
require('plug/firenvim')
--require('plug/fcitx')
require('plug/nvim-lspconfig-ui')
--require('plug/nvim-next')

--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    vim.lsp.buf.format()
--  end,
--})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end

  "Vim defaults set
  set tabstop=8
  " after softtabstop*N will turn into <Tab> character
  "set softtabstop=2
  " replace tab with spaces
  set expandtab

  "setting this to 0 means it will use tabstop
  " shiftwidth >>
  "set shiftwidth=4
  set shiftwidth=2

  set number relativenumber
  " display both relative and linenumber at same time
  "set statuscolumn=%@SignCb@%=%T%@NumCb@%l%s%r│%T

  set wildmode=longest:full,list,full

  set spelllang=en_us
  "set foldmethod=indent
  "set foldmethod=syntax
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

  set cursorline
  "set spell
  "set autoindent
  set scrollback=100000

  " Alias
  command W noa wq

  COQnow -s
]])


-- Commands I tend to forgot
-- :noa wq >>> ignore autocommand for following commands
