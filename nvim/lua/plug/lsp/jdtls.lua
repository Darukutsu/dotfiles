local home = vim.fn.getenv("HOME")
local root_dir_path = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' })
local project_name = vim.fn.fnamemodify(root_dir_path, ":p:h:t")
--local project_name = vim.fn.fnamemodify(root_dir_path, ":p:h")
local workspace_dir = home .. '/.cache/jdtls-workspace/' .. project_name
--local workspace_dir = project_name .. '/.workspace'

require("lspconfig").jdtls.setup {
  --looks like it's automaticaly solved
  --require('coq').lsp_ensure_capabilities({}),
  cmd = {
    'jdtls',
    --home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
    --'-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_dir,
  },
  --root_dir = require('jdtls.setup').find_root({ '.git' }),

  init_options = {
    workspace = workspace_dir,
  },

  settings = {

    java = {
      --single_file_support = false,
      autobuild = {
        enabled = false,
      },
      --import = {
      --  gradle = {
      --    enabled = true,
      --  },
      --},
      codeGeneration = {
        useBlocks = true,
      },
      completion = {
        chain = {
          enabled = true,
        }
      },
      implementationsCodeLens = {
        enabled = true
      },
      referencesCodeLens = {
        enabled = true
      },
      edit = {
        smartSemicolonDetection = {
          enabled = false
        },
        validateAllOpenBuffersOnChanges = {
          enabled = false
        },
      },
      sources = {
        organizeImports = {
          staticStarThreshold = 999,
          starThreshold = 999,
        },
      },
      symbols = {
        includeSourceMethodDeclarations = true
      },
      signatureHelp = {
        description = {
          enabled = true
        },
      },
      saveActions = {
        organizeImports = true
      },
    },
  },
}
