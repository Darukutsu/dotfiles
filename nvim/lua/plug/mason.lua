--local lsp_zero = require('lsp-zero')
--
--lsp_zero.on_attach(function(client, bufnr)
--  -- see :help lsp-zero-keybindings
--  -- to learn the available actions
--  lsp_zero.default_keymaps({ buffer = bufnr })
--end)





require("mason").setup();

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function autoformat_quit(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

--https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
local lsp_handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup { require('coq').lsp_ensure_capabilities({}) }
  end,

  -- Next, you can provide a dedicated handler for specific servers.
  ["lua_ls"] = function()
    require("plug/lsp/lua_ls")
  end,
  --["pyright"] = function()
  --  require("plug/lsp/pyright")
  --end,
  --["pylyzer"] = function()
  --  require("plug/lsp/pylyzer")
  --end,
  ["jdtls"] = function()
    require("plug/lsp/jdtls")
  end,
  ["clangd"] = function()
    require("plug/lsp/clangd")
  end,
  ["rust_analyzer"] = function()
    require("plug/lsp/rust-tools")
  end,
  --["matlab_ls"] = function()
  --  require("plug/lsp/matlab")
  --end,
  ["ltex"] = function()
    require("plug/lsp/ltex")
  end,
}

require("mason-lspconfig").setup({
  --handlers = {
  --  lsp_zero.default_setup,
  --  jdtls = lsp_zero.noop,
  --},
  handlers = lsp_handlers,
  --automatic_installation=true,
});





local dap_handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("mason-nvim-dap").default_setup(server_name)
  end,
  --["codelldb"] = function(server_name)
  --  server_name.adapters = {
  --    type = 'server',
  --    port = "${port}",
  --    executable = {
  --      -- CHANGE THIS to your path!
  --      command = '/usr/bin/codelldb',
  --      args = { "--port", "${port}" },

  --      -- On windows you may have to uncomment this:
  --      -- detached = false,
  --    },
  --  }
  --end,
}
require("mason-nvim-dap").setup({
  automatic_installation = true,
  --handlers = {},
  handlers = dap_handlers,
})





local mason_null = require("mason-null-ls")
mason_null.setup({
  ensure_installed = nil,
  --automatic_installation = true,
  automatic_setup = true,
  --methods = {
  --  diagnostics = false,
  --  formatting = true,
  --  code_actions = false,
  --  completion = false,
  --  hover = false,
  --},
  --handlers = null_handlers,
  handlers = {
    --  --["shfmt"] = function(source_name, methods)
    --  --  mason_null.default_setup(source_name, methods) -- to maintain default behavior
    --  --    --register(null_ls.builtins.formatting.shfmt.with({
    --  --    --extra_args = { "-i", "2" },
    --  --    --}))
    --  --end,
  },
})





--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
--
--if unsupported when installing new check this
--https://github.com/nvimtools/none-ls.nvim/discussions/81
local null_ls = require("null-ls")
--local null_handlers = {
--  ["shfmt"] = function(source_name, methods)
--    null_ls.register(null_ls.builtins.formatting.shfmt.with({
--      extra_args = { "-i", "2" },
--    }))
--  end,
--  --["beautysh"] = function(source_name, methods)
--  --  null_ls.register(null_ls.builtins.formatting.beautysh.with({
--  --    extra_args = { "-i", "2" },
--  --  }))
--  --end,
--  --["autopep8"] = function(source_name, methods)
--  --  null_ls.register(null_ls.builtins.formatting.autopep8.with({
--  --    extra_args = { "--indent-size=2", "--ignore=E121" },
--  --  }))
--  --end,
--}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2" },
    }),
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = autoformat_quit,
})
