local original_notify = vim.notify
vim.notify = function(msg, log_level, opts)
  if msg == "method textDocument/documentColor is not supported by any of the servers registered for the current buffer" then
    -- Do nothing to suppress the warning
  else
    -- Call the original vim.notify function for other messages
    original_notify(msg, log_level, opts)
  end
end
