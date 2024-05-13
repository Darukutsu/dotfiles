return {
  'lambdalisue/suda.vim', -- write sudo if not in sudo
  'alx741/vinfo',         -- vim GNU info implementation <C-]> follow tag
  --'HiPhish/info.vim'                    -- vim GNU info implementation
  --{
  --'linty-org/readline.nvim',             -- readline navigation for :, / or ?
  --  config = function()
  --require('plug/readline')
  --  end,
  --},
  --{
  --'mbbill/undotree',                     -- undo any history
  --  config = function()
  --require('plug/undotree')
  --  end,
  --},
  --
  --{
  --'edluffy/hologram.nvim',               -- images in nvim
  --  config = function()
  --require('plug/hologram')
  --  end,
  --},
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup({
        explorer = {
          cmd = "nnn",
          width = 30,
        }
      })
    end,
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
    config = function()
      require('plug/overseer')
    end,
  },
  {
    'uga-rosa/ccc.nvim', -- color picker with :CccPick
    config = function()
      require('plug/ccc')
    end,
  },
  {
    'folke/flash.nvim', --better fF
    event = "VeryLazy",
    config = function()
      require('plug/flash')
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      --require('plug/marks')
    end,
  },
  {
    'chentoast/marks.nvim', -- mark hint on side
    config = function()
      require('plug/marks')
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('plug/harpoon')
    end,
  },
  {
    'gen740/SmoothCursor.nvim', --cursor scroll animations
    dependencies = {
      --'edluffy/specs.nvim',     --cursor animations
      --'karb94/neoscroll.nvim',  --smooth scrolling
    },
    config = function()
      require('plug/animations')
    end,
  },
  {
    'folke/which-key.nvim', -- key help floating while typing
    config = function()
      require('plug/which-key')
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim', -- indent show
    config = function()
      require('plug/indent-blank')
    end,
  },

  'lervag/vimtex',             -- latex thingi...
  {
    'ghostbuster91/nvim-next', -- repeable movements ;, for all commands
    config = function()
      require('plug/nvim-next')
    end,
  },
  --'michaeljsmith/vim-indent-object'     -- python textobject
  --'chaoren/vim-wordmotion'              -- advanced wordmotion
  {
    'chrisgrieser/nvim-spider', -- advanced wordmotion
    config = function()
      require("spider").setup {
        skipInsignificantPunctuation = true,
        subwordMovement = true,
        customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
      }
    end,
  },

  'chrisgrieser/nvim-various-textobjs', -- advanced textobjects
  {
    'wellle/targets.vim',               -- advanced treesitter textobjects
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

  'tpope/vim-sleuth',          -- heuristic shiftwidth
  {
    'mfussenegger/nvim-jdtls', -- java
    dependencies = {
      { 'mfussenegger/nvim-dap' },
    },
  },
  --'folke/trouble.nvim'                  -- diagnostics haven't tried yet

  --{
  --  'glacambre/firenvim',
  --  build = function() vim.fn['firenvim#install'](0) end,
  --config = function()
  --require('plug/firenvim')
  --end,
  --}

  --'ellisonleao/glow.nvim' -- highlight marker, markdown files etc
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn['mkdp#util#install']() end,
  },

  --{ -- better quickfix window
  --  'kevinhwang91/nvim-bqf',
  --  ft = 'qf',
  --  dependencies = {
  --    -- optional
  --    {
  --      'junegunn/fzf',
  --      build = function()
  --        vim.fn['fzf#install']()
  --      end
  --    }
  --  }
  --},

  --use{
  --  'anuvyklack/pretty-fold.nvim',
  --  config = function() require('pretty-fold').setup() end
  --}

  --{ -- colorize depending on color code
  --  'norcalli/nvim-colorizer.lua',
  --  config = function() require('colorizer').setup() end
  --}

  {
    'NeogitOrg/neogit',          -- git integration
    dependencies = {
      'lewis6991/gitsigns.nvim', -- git time stamps
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('plug/neogit')
      require('gitsigns').setup()
    end,
  },

  { -- debug ui
    'rcarriga/nvim-dap-ui',
    dependencies = { { 'folke/neodev.nvim' }, { 'mfussenegger/nvim-dap' }, { 'nvim-neotest/nvim-nio' }, },
    config = function()
      require('plug/dapui')
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end,
  },

  { -- MASON, formatter/linter, debugger, lsp
    'williamboman/mason.nvim',
    dependencies = {
      { 'nvimtools/none-ls.nvim' },
      --{ 'jose-elias-alvarez/null-ls.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },
      --{ 'WhoIsSethDaniel/mason-tool-installer.nvim' },

      { 'mfussenegger/nvim-dap' },
      { 'jay-babu/mason-nvim-dap.nvim' },

      --{ 'creativenull/efmls-configs-nvim' },
      --{ 'VonHeikemen/lsp-zero.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      require('plug/mason')
      require('plug/nvim-lspconfig-ui')
    end,
  },

  -- Clang config start
  'p00f/clangd_extensions.nvim',
  -- Clang config end

  -- Rust config start
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
  },
  -- Rust config end

  { -- COQ
    --'windwp/nvim-autopairs',
    'ms-jpq/coq_nvim',
    branch = 'coq',
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
      { 'ms-jpq/coq.artifacts' },
      { 'ms-jpq/coq.thirdparty' },
      build = ':COQdeps',
    },
    config = function()
      require('plug/coq')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'debugloop/telescope-undo.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      require('plug/telescope')
    end,
  },

  { -- fancy line
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'folke/tokyonight.nvim' },
      --{ 'shaunsingh/nord.nvim' },
    },
    config = function()
      require('theme')
      require('plug/nvim-web-icons')
    end,
  },

  --{ -- fancy startup screen. Telescope >> fancy fuzzyfinder
  --  'startup-nvim/startup.nvim',
  --  dependencies = {
  --    'nvim-telescope/telescope.nvim',
  --    'nvim-lua/plenary.nvim'
  --  },
  --},

  {
    'nvim-treesitter/nvim-treesitter', -- highlight code
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('plug/treesitter')
    end,
  },
}
