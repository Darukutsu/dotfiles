local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--vim.g.mapleader = " "

require('keymap')
require("lazy").setup("plugins")

local buf_name = vim.api.nvim_buf_get_name(0)
local ft = vim.fn.fnamemodify(buf_name, ':t')

if ft == 'man' or ft == 'pager' then
  require('pager')
end

--require('plug/fcitx')
--require('plug/suppress-errors')

-- ZLS disable quickfix
vim.g.zig_fmt_parse_errors = 0

vim.cmd([[
  let g:neovide_scroll_animation_length = 0
  "let g:neovide_cursor_animate_command_line = v:false
  "let g:neovide_cursor_trail_size = 0

  au TextYankPost * silent! lua vim.highlight.on_yank {timeout=350}

  set expandtab
  set tabstop=8
  " after softtabstop*N will turn into <Tab> character
  "set softtabstop=0 noexpandtab
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

  " Fucks with block pasting
  set clipboard+=unnamedplus
  "set clipboard+=unnamed

  set cmdheight=0

  COQnow -s
]])


-- Commands I tend to forgot
-- :noa wq >>> ignore autocommand for following commands
