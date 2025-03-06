-- https://github.com/ghostbuster91/nvim-next
local nvim_next_builtins = require("nvim-next.builtins")
require("nvim-next").setup({
  default_mappings = {
    repeat_style = "original",
  },
  items = {
    nvim_next_builtins.f,
    nvim_next_builtins.t
  },
})

require("nvim-next.integrations").treesitter_textobjects()

--local next = require("nvim-next").setup()
--vim.keymap.set("n", "f", next.make_repeatable_pair(functions.F, functions.f)) -- (prev, next)
--vim.keymap.set("n", "F", next.make_repeatable_pair(functions.f, functions.F))
