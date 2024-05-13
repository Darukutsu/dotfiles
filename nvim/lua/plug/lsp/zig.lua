require("lspconfig").zls.setup {
  settings = {
    zig = {
      zls = {
        warnStyle = {
          enabled = true,
        },
        highlightGlobalVarDeclarations = {
          enabled = true,
        },
      },
    },
  },
}
