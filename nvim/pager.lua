package.path = package.path .. ";/home/daru/.config/nvim/init.lua"
require('init')

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
