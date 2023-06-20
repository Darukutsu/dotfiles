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
--require('plug/nvim-next')

--vim.b.page_alternate_bufnr = {$initial_buf_nr}
if vim.wo.scrolloff > 999 or vim.wo.scrolloff < 0 then
  vim.g.page_scrolloff_backup = 0
else
  vim.g.page_scrolloff_backup = vim.wo.scrolloff
end
vim.bo.scrollback, vim.wo.scrolloff, vim.wo.signcolumn, vim.wo.number =
    100000, 999, 'no', false
--{$filetype}
--{$edit}
vim.api.nvim_create_autocmd('BufEnter', {
  buffer = 0,
  callback = function() vim.wo.scrolloff = 999 end
})
vim.api.nvim_create_autocmd('BufLeave', {
  buffer = 0,
  callback = function() vim.wo.scrolloff = vim.g.page_scrolloff_backup end
})
--{$notify_closed}
-- Is set only on output buffers

local closed = 'rpcnotify({channel}, "page_buffer_closed", "{page_id}")'
vim.api.nvim_create_autocmd('BufDelete', {
  buffer = 0,
  command = 'silent! call ' .. closed
})
--{$pre}
vim.cmd 'silent doautocmd User PageOpen | redraw'
--{$lua_provided_by_user}
--{$cmd_provided_by_user}
--{$after}

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
  COQnow -s
]])


-- Commands I tend to forgot
-- :noa wq >>> ignore autocommand for following commands
