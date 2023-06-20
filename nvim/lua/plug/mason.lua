require("mason").setup();

--https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
local lsp_handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,

  -- Next, you can provide a dedicated handler for specific servers.
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    }
  end,
  --["pyright"] = function()
  --  require("lspconfig").pyright.setup {
  --    -- AUTOFORMATTING
  --    on_attach = function(client, bufnr)
  --      if client.supports_method("textDocument/formatting") then
  --        vim.api.nvim_clear_autocmds({
  --          group = augroup,
  --          buffer = bufrn,
  --        })
  --        vim.api.nvim_create_autocmd("BufWritePre", {
  --          group = augroup,
  --          buffer = bufrn,
  --          callback = function()
  --            vim.lsp.buf.format({ bufnr = bufnr })
  --          end,
  --        })
  --      end
  --    end,
  --    --capabilities = capabilities,
  --    filetypes = { "python" },
  --  }
  --end,
  --["pylyzer"] = function()
  --  require("lspconfig").pylyzer.setup {
  --    settings = {
  --      Python = {
  --        diagnostics = {
  --          -- Get the language server to recognize the `vim` global
  --          globals = { 'config' },
  --        },
  --      },
  --    },
  --  }
  --end,
  ["clangd"] = function()
    require("plug/clangd")

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
  end,
  ["rust_analyzer"] = function()
    require("plug/rust-tools")
  end,
  ["ltex"] = function()
    require("lspconfig").ltex.setup {
      filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "text", "plain" }
    }
  end,
}
require("mason-lspconfig").setup({ handlers = lsp_handlers });


--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
local null_ls = require("null-ls")
local null_handlers = {
  ["beautysh"] = function(source_name, methods)
    null_ls.register(null_ls.builtins.formatting.beautysh.with({
      extra_args = { "-i", "2" },
    }))
  end,
  --["autopep8"] = function(source_name, methods)
  --  null_ls.register(null_ls.builtins.formatting.autopep8.with({
  --    extra_args = { "--indent-size=2", "--ignore=E121" },
  --  }))
  --end,
}
require("mason-null-ls").setup({
  automatic_installation = true,
  automatic_setup = true,
  handlers = null_handlers,
  --handlers = {},
})





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





-- Autoformat on quit
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
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
  end,
})
