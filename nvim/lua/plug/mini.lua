--require("mini.pairs").setup{}
--require("mini.surround").setup{}
require("mini.move").setup {}
require("mini.splitjoin").setup {
  mappings = {
    toggle = 'gs',
  },
}

local map = vim.keymap.set
map({ "n", "o", "x" }, "gJ", function() MiniSplitjoin.toggle() end, {})
map({ "n", "o", "x" }, "<leader>J", function() MiniSplitjoin.toggle() end, {})
