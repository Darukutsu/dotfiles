require('plugins')
require('keymap')
require('theme')

require('plug/dap')
require('plug/telescope')
--require('telescope').load_extension('dap')
require('plug/CCC')
--require('plug/hologram')
require('plug/COQ')
--require('plug/rust-tools')
require('plug/treesitter')
require('plug/readline')
require('plug/undotree')
require('plug/mason')
--require('plug/lsp-signature')


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end

  " firenvim
  let g:firenvim_config = { 
      \ 'globalSettings': {
	  \ 'alt': 'all',
      \  },
      \ 'localSettings': {
	  \ '.*': {
	      \ 'cmdline': 'neovim',
	      \ 'content': 'text',
	      \ 'priority': 0,
	      \ 'selector': 'textarea',
	      \ 'takeover': 'always',
	  \ },
      \ }
  \ }
  let fc = g:firenvim_config['localSettings']
  "let fc['https://discord\.com.+'] = { 'takeover': 'never', 'priority': 1 }
  let fc['https?://.*'] = { 'takeover': 'never'}

  "Vim defaults set
  set tabstop=8

  "setting this to 0 means it will use tabstop
  "set shiftwidth=4
  "set expandtab
  set shiftwidth=2
  "set softtabstop=2

  set number relativenumber
  set wildmode=longest:full,list,full

  set spelllang=en_us
  "set foldmethod=indent
  "set foldmethod=syntax
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()

  set cursorline
  "set spell
  "set autoindent
  COQnow -s
]])

