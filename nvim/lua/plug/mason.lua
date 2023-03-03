require("mason").setup();
require("mason-lspconfig").setup();
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if (server_name == "sumneko_lua")
    then
      require("lspconfig").lua_ls.setup {}
      --elseif (server_name == "clangd")
      --then
      --  require("lspconfig").clangd.setup {
      --    settings = {
      --      clangd = {
      --        diagnostic = {
      --          enable = true,
      --          -- Disable the specific diagnostic message here
      --          suppressions = {

      --          },
      --        },
      --      },
      --    },
      --  }
    else
      require("lspconfig")[server_name].setup {}
    end
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["ltex"] = function()
    require("lspconfig").ltex.setup {
      filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "text", "plain" }
    }
  end
}

--vim.diagnostic.config({
--  virtual_text = false
--})

-- Show line diagnostics automatically in hover window
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
