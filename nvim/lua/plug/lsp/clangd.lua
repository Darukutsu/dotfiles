require("clangd_extensions").setup {

}

--require("lspconfig").clangd.setup {
--  cmd = { "clangd", "--background-index" },
--  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
--  init_options = {
--    clangdFileStatus = true,
--    usePlaceholders = true,
--    completeUnimported = true,
--    semanticHighlighting = true,
--  },
--  -- Mostly for keybindings, autocompletion, set buffer options etc.
--  on_attach = {},
--  settings = {
--    clangd = {
--      diagnostic = {
--        enable = true,
--        -- Disable the specific diagnostic message here
--        suppressions = {

--        },
--      },
--      formatting = "file",
--      format = {
--        BasedOnStyle = "llvm",
--        IndentWidth = 4,
--        ColumnLimit = 120,
--      },
--      completion = {
--        caseSensitive = false,
--        triggerCharacter = { "." },
--      },
--    },
--  },
--}
