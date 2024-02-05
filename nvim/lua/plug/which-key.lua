local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 500
wk.setup {
  triggers_nowait = {
    --"<leader><leader>",
    "<leader>s",
  },
  --plugins = {
  --  presets = {
  --    text_objects = true, }
  --},
  --M.objects={
  --},
  --operators = { gc = "Comments"}
}

--TODO: fix for noremap 'l'<>'i'
local O = {
  --noremap = false,
}
local M = {}

wk.register(M, O)
