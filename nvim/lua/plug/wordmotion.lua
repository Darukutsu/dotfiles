-- for chaoren/vim-wordmotion
vim.cmd([[
  let g:wordmotion_mappings={  'e':'', 'E':'', 'j':'<M-e>', 'J':'<M-E>',  }
]])

require("spider").setup {
  skipInsignificantPunctuation = true,
  subwordMovement = true,
  customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
}

-- for chrisgrieser/nvim-spider
vim.keymap.set({ "n", "o", "x" },
  "w",
  "<cmd>lua require('spider').motion('w')<CR>", {})
vim.keymap.set({ "n", "o", "x" },
  "b",
  "<cmd>lua require('spider').motion('b')<CR>", {})
vim.keymap.set({ "n", "o", "x" },
  "j",
  "<cmd>lua require('spider').motion('e')<CR>", {})
--"<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation=false })<CR>", {})

vim.keymap.set({ "n", "o", "x" },
  "W",
  "<cmd>lua require('spider').motion('w', { subwordMovement = false })<CR>", {})
vim.keymap.set({ "n", "o", "x" },
  "B",
  "<cmd>lua require('spider').motion('b', { subwordMovement = false })<CR>", {})
vim.keymap.set({ "n", "o", "x" },
  "J",
  "<cmd>lua require('spider').motion('e', { subwordMovement = false})<CR>", {})
--"<cmd>lua require('spider').motion('e', { subwordMovement = false, skipInsignificantPunctuation=false })<CR>", {})

-- for chrisgrieser/nvim-various-textobjs
vim.keymap.set({ "o", "x" }, "iw", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
vim.keymap.set({ "o", "x" }, "lw", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
vim.keymap.set({ "o", "x" }, "aw", "<cmd>lua require('various-textobjs').subword('outer')<CR>")
--vim.keymap.set({ "o", "x" }, "iW", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
--vim.keymap.set({ "o", "x" }, "lW", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
--vim.keymap.set({ "o", "x" }, "aW", "<cmd>lua require('various-textobjs').subword('outer')<CR>")
vim.keymap.set({ "o", "x" }, "u", "<cmd>lua require('various-textobjs').url()<CR>")

-- for wellle/targets.vim
