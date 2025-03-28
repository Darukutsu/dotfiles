-- all cool plugins see my stared https://github.com/stars/Darukutsu/lists/nvim
return {
  --                     _     __ _
  -- __      _____  _ __| | __/ _| | _____      __
  -- \ \ /\ / / _ \| '__| |/ / |_| |/ _ \ \ /\ / /
  --  \ V  V / (_) | |  |   <|  _| | (_) \ V  V /
  --   \_/\_/ \___/|_|  |_|\_\_| |_|\___/ \_/\_/
  --
  --
  --
  "tpope/vim-sleuth", -- heuristic shiftwidth

  { -- COQ
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
      { "ms-jpq/coq.artifacts" },
      { "ms-jpq/coq.thirdparty" },
      build = ":COQdeps",
    },
    config = function()
      require("plug/coq")
    end,
  },

  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify",
    config = function()
      require("plug/nvim-recorder")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "jonarrien/telescope-cmdline.nvim" },
      { "gbrlsnchs/telescope-lsp-handlers.nvim" },
    },
    config = function()
      require("plug/telescope")
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("plug/ufo")
    end,
  },

  {
    "NeogitOrg/neogit", -- git integration
    event = "VeryLazy",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- git time stamps
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plug/neogit")
      require("plug/gitsigns")
    end,
  },

  {
    "ghostbuster91/nvim-next", -- repeable movements ;, for all commands
    config = function()
      require("plug/nvim-next")
    end,
  },

  {
    "chrisgrieser/nvim-spider", -- advanced wordmotion
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = true,
        consistentOperatorPending = true,
        subwordMovement = true,
        customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
      })
    end,
  },

  {
    "wellle/targets.vim", -- advanced treesitter textobjects
    dependencies = {
      "chrisgrieser/nvim-various-textobjs", -- advanced textobjects
    },
    config = function()
      vim.cmd([[
        " targets.vim
        let g:targets_nl=['n', 'N']
        " due to this i have to inoremap and nnoremap for colemak
        " let g:targets_aiAI='alAL'
        "let g:targets_mapped_aiAI='aiAI'
        let g:targets_gracious = 1
    ]])
    end,
  },

  {
    "folke/which-key.nvim", -- key help floating while typing
    event = "VeryLazy",
    opts = {},
  },

  {
    "chentoast/marks.nvim", -- mark hint on side
    config = function()
      require("plug/marks")
    end,
  },
  -- marks are for jumps within work file
  -- harpoon for jumps over work files
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("plug/harpoon")
    end,
  },

  {
    "echasnovski/mini.nvim", -- whole workflow, using only few functions
    version = false,
    config = function()
      require("plug/mini")
    end,
  },

  {
    "uga-rosa/ccc.nvim", -- color picker with :CccPick
    config = function()
      require("plug/ccc")
    end,
  },

  {
    "folke/flash.nvim", --better fF
    event = "VeryLazy",
    config = function()
      require("plug/flash")
    end,
  },

  {
    "folke/snacks.nvim", -- this has complete workflow, i just need working vim.ui.select
    priority = 1000,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("plug/snacks"),
  },
  --  _ _
  -- | (_)_ __  _   ___  __
  -- | | | '_ \| | | \ \/ /
  -- | | | | | | |_| |>  <
  -- |_|_|_| |_|\__,_/_/\_\
  --
  --
  --
  --
  {
    "denialofsandwich/sudo.nvim", -- write sudo if not in sudo
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
  },
  "alx741/vinfo", -- vim GNU info implementation <C-]> follow tag
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup({
        explorer = {
          cmd = "nnn",
          width = 30,
        },
      })
    end,
  },
  --
  --  _     ____  ____
  -- | |   / ___||  _ \
  -- | |   \___ \| |_) |
  -- | |___ ___) |  __/
  -- |_____|____/|_|
  --
  --
  --
  --
  "lervag/vimtex", -- latex thingi...
  --'folke/trouble.nvim'                  -- diagnostics haven't tried yet

  {
    "mfussenegger/nvim-jdtls", -- java
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
  },

  { -- MASON, formatter/linter, debugger, lsp
    "williamboman/mason.nvim",
    dependencies = {
      { "nvimtools/none-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
      { "mfussenegger/nvim-dap" },
      { "jay-babu/mason-nvim-dap.nvim" },
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("plug/mason")
      require("plug/nvim-lspconfig-ui")
    end,
  },

  -- Clang config start
  "p00f/clangd_extensions.nvim",
  -- Clang config end

  -- Rust config start
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "neovim/nvim-lspconfig" },
    },
  },
  -- Rust config end

  {
    "nvim-treesitter/nvim-treesitter", -- highlight code
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
      require("plug/treesitter")
    end,
  },
  --      _      _
  --   __| | ___| |__  _   _  __ _  __ _  ___ _ __
  --  / _` |/ _ \ '_ \| | | |/ _` |/ _` |/ _ \ '__|
  -- | (_| |  __/ |_) | |_| | (_| | (_| |  __/ |
  --  \__,_|\___|_.__/ \__,_|\__, |\__, |\___|_|
  --                         |___/ |___/
  --
  --
  --
  { -- debug ui
    "rcarriga/nvim-dap-ui",
    dependencies = { { "folke/lazydev.nvim" }, { "mfussenegger/nvim-dap" }, { "nvim-neotest/nvim-nio" } },
    config = function()
      require("plug/dapui")
      require("lazydev").setup({
        library = { "nvim-dap-ui" },
      })
    end,
  },

  {
    "stevearc/overseer.nvim", -- task runner, like shell, good for dap
    opts = {},
    config = function()
      require("plug/overseer")
    end,
  },
  --  _   _
  -- | |_| |__   ___ _ __ ___   ___  ___
  -- | __| '_ \ / _ \ '_ ` _ \ / _ \/ __|
  -- | |_| | | |  __/ | | | | |  __/\__ \
  --  \__|_| |_|\___|_| |_| |_|\___||___/
  --
  --
  --
  --
  "Eandrju/cellular-automaton.nvim",
  {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
      vim.g.baleia = require("baleia").setup({
        -- TODO: try again when fixed and displays properly
        --strip_ansi_codes = true,
        --colors = NR_256,
      })

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs
      vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })

      --vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
      --  pattern = "*",
      --  callback = function()
      --    vim.g.baleia.automatically(vim.api.nvim_get_current_buf())
      --  end,
      --})
    end,
  },

  { -- fancy line
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "folke/tokyonight.nvim" },
      { "alexxGmZ/e-ink.nvim" },
    },
    config = function()
      require("theme")
      require("plug/nvim-web-icons")
    end,
  },
}
