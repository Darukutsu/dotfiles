require("lspconfig").pylyzer.setup {
  settings = {
    Python = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'config' },
      },
    },
  },
}
