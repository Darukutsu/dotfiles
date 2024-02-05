require("clangd_extensions").setup {}

local function myon_attach()
  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

require("lspconfig").clangd.setup {
  on_attach = myon_attach,
}
--settings = {
--  settings = {
--    clangd = {
--      --diagnostic = {
--      --  enable = true,
--      --  -- Disable the specific diagnostic message here
--      --  suppressions = {},
--      --},
--      --formatting = "file",
--      format = {
--        BasedOnStyle = "llvm",
--        TabWidth = 8,
--        IndentWidth = 8,
--        ColumnLimit = 90,
--        SortIncludes = true,
--        IndentCaseLabels = false,
--      },
--      completion = {
--        caseSensitive = false,
--        triggerCharacter = { "." },
--      },
--    },
--  },
--}

--require("lspconfig").clangd.setup {
--  --cmd = { "clangd", "--background-index" },
--  --filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--  --init_options = {
--  --  clangdFileStatus = true,
--  --  usePlaceholders = true,
--  --  completeUnimported = true,
--  --  semanticHighlighting = true,
--  --},
--}
