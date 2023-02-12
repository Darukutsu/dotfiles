require("mason").setup();
require("mason-lspconfig").setup();
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    if (server_name == "sumneko_lua")
    then
      require("lspconfig").lua_ls.setup {}
    else
      require("lspconfig")[server_name].setup {}
    end
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["ltex"] = function ()
    require("lspconfig").ltex.setup {
      filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "text", "plain"}
    }
  end
}
