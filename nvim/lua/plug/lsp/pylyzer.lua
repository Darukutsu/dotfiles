require("lspconfig").pylyzer.setup {
  settings = {
    Python = {
      diagnostics = {
        -- Get the language server to recognize the `` global
        globals = { 'config' },
      },
    },
  },
}
