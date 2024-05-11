require('plugins')
--require('keymap')
require('keymap-colemak')
require('theme')
require('plug/coq')
require('plug/mason')
require('plug/treesitter')
--require('plug/dap') -- not needed to setup if using mason
require('plug/dapui')
require('plug/telescope')
--require('plug/hologram')
--require('plug/linter')
--require('plug/undotree')
--require('plug/readline')
require('plug/indent-blank')
require('plug/which-key')
require('plug/ccc')
--require('plug/firenvim')
--require('plug/fcitx')
require('plug/nvim-lspconfig-ui')
require('plug/nvim-web-icons')
--require('plug/nvim-next')
require('plug/neogit')
require('plug/marks')
require('plug/flash')
--require('plug/flit')
--require('plug/suppress-errors')
--require('plug/animations')

--vim.api.nvim_create_autocmd("BufWritePre", {
--  callback = function()
--    vim.lsp.buf.format()
--  end,
--})

vim.cmd([[
  let g:neovide_scroll_animation_length = 0
  "let g:neovide_cursor_animate_command_line = v:false
  "let g:neovide_cursor_trail_size = 0

  nnoremap <leader><leader>c :so $XDG_CONFIG_HOME/nvim/lua/keymap-colemak.lua<cr>
  nnoremap <leader><leader>q :so $XDG_CONFIG_HOME/nvim/lua/keymap.lua<cr>

  au TextYankPost * silent! lua vim.highlight.on_yank {timeout=350}

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end

  "Vim defaults set
  set tabstop=8
  " after softtabstop*N will turn into <Tab> character
  "set softtabstop=0 noexpandtab
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
  " Automatic save folds
  "https://www.vim.org/scripts/script.php?script_id=4021
  "autocmd BufWinLeave *.* mkview
  "autocmd BufWinEnter *.* silent loadview

  " Automatic open folds when openinig file
  set foldlevelstart=99

  set cursorline
  "set spell
  "set autoindent
  "set smartindent
  set scrollback=100000

  " fixes man page bindings
  let g:no_man_maps=1

  " Alias
  command W noa wq

  " targets.vim
  "let g:targets_nl='kK'
  let g:targets_nl='nN'
  " due to this i have to inoremap and nnoremap"
  let g:targets_aiAI='alAL'
  let g:targets_mapped_aiAI='aiAI'
  let g:targets_gracious = 1

  COQnow -s
]])


-- Commands I tend to forgot
-- :noa wq >>> ignore autocommand for following commands
