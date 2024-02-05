require 'rust-tools'.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<leader>rh", ":lua require'rust-tools'.hover_actions.hover_actions()<cr>", { buffer = bufnr })
      --vim.keymap.set("n", "<leader>rr", ":lua require'rust-tools'.hover_range.hover_range()<cr>", { buffer = bufnr })
      vim.keymap.set("n", "<leader>rm", ":lua require'rust-tools'.parent_module.parent_module()<cr>", { buffer = bufnr })
      --vim.keymap.set("n", "<leader>a", ":lua require'rust-tools'.code_action_group.code_action_group, { buffer = bufnr })
      vim.keymap.set("n", "<leader>rc", ":lua require'rust-tools'.open_cargo_toml.open_cargo_toml()<cr>")
    end,
  },
})
