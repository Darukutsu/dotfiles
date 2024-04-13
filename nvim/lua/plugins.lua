local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  ---@format disable-next
  use 'lambdalisue/suda.vim'                -- write sudo if not in sudo
  ---@format disable-next
  use 'alx741/vinfo'                        -- vim GNU info implementation <C-]> follow tag
  --use 'HiPhish/info.vim'                    -- vim GNU info implementation
  --use 'linty-org/readline.nvim'             -- readline navigation for :, / or ?
  --use 'mbbill/undotree'                     -- undo any history
  --use 'edluffy/hologram.nvim'               -- images in nvim
  use 'uga-rosa/ccc.nvim'                   -- color picker with :CccPick
  use 'lervag/vimtex'                       -- latex thingi...
  use 'lukas-reineke/indent-blankline.nvim' -- indent show
  use 'ghostbuster91/nvim-next'             -- repeable movements ;, for all commands
  use 'folke/which-key.nvim'                -- key help floating while typing
  --use 'michaeljsmith/vim-indent-object'     -- python textobject
  --use 'chaoren/vim-wordmotion'              -- advanced wordmotion
  ---@format disable-next
  use 'chrisgrieser/nvim-spider'            -- advanced wordmotion
  ---@format disable-next
  use 'chrisgrieser/nvim-various-textobjs'  -- advanced textobjects
  ---@format disable-next
  use 'wellle/targets.vim'                  -- advanced treesitter textobjects
  ---@format disable-next
  use 'chentoast/marks.nvim'                -- mark hint on side
  ---@format disable-next
  use 'tpope/vim-sleuth'                    -- heuristic shiftwidth
  ---@format disable-next
  use 'mfussenegger/nvim-jdtls'             -- java
  --use 'folke/trouble.nvim'                  -- diagnostics haven't tried yet
  ---@format disable-next
  use 'folke/flash.nvim'                    --better fF




  --use {
  --  'glacambre/firenvim',
  --  run = function() vim.fn['firenvim#install'](0) end
  --}

  --use 'ellisonleao/glow.nvim' -- highlight marker, markdown files etc
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  use { -- better quickfix window
    'kevinhwang91/nvim-bqf', ft = 'qf',
    requires = {
      -- optional
      use { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
      end
      }
    }
  }

  --use{
  --  'anuvyklack/pretty-fold.nvim',
  --  config = function() require('pretty-fold').setup() end
  --}

  --use { -- colorize depending on color code
  --  'norcalli/nvim-colorizer.lua',
  --  config = function() require('colorizer').setup() end
  --}

  use {
    'luukvbaal/nnn.nvim',
    config = function() require('nnn').setup() end
  }
  use { -- git integration
    'NeogitOrg/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-tree/nvim-web-devicons'
    }
  }

  use { -- git time stamps
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  --use { -- highlight fF colors
  --  'kevinhwang91/nvim-fFHighlight',
  --  config = function() require('fFHighlight').setup() end
  --}

  --use { -- enhanced fF
  --  'ggandor/flit.nvim',
  --  requires = { { 'ggandor/leap.nvim' }, { 'tpope/vim-repeat' }, },
  --}

  use { -- debug ui
    'rcarriga/nvim-dap-ui',
    requires = { { 'mfussenegger/nvim-dap' }, { 'nvim-neotest/nvim-nio' }, },
  }

  use { -- MASON, formatter/linter, debugger, lsp
    'williamboman/mason.nvim',
    requires = {
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
  }

  -- Clang config start
  use 'p00f/clangd_extensions.nvim'
  -- Clang config end

  -- Rust config start
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
  }
  -- Rust config end

  use { -- COQ
    'windwp/nvim-autopairs',
    requires = {
      { 'windwp/nvim-ts-autotag' },
      { 'ms-jpq/coq_nvim',       branch = 'coq' },
      { 'ms-jpq/coq.artifacts' },
      { 'ms-jpq/coq.thirdparty' },
      run = ':COQdeps',
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'debugloop/telescope-undo.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
    },
  }

  use { -- fancy line
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'nvim-tree/nvim-web-devicons', opt = true },
      { 'folke/tokyonight.nvim' },
      --{ 'shaunsingh/nord.nvim' },
    },
  }

  use { -- fancy startup screen. Telescope >> fancy fuzzyfinder
    'startup-nvim/startup.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim'
    },
  }

  use { -- highlight code
    'nvim-treesitter/nvim-treesitter', requires = { 'nvim-treesitter/nvim-treesitter-textobjects',
  },
    run = ':TSUpdate',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- https://github.com/wbthomason/packer.nvim#requirements for config
-- :PackerSync

--use {
--  'myusername/example',        -- The plugin location string
--
--  -- The following keys are all optional
--  disable = boolean,           -- Mark a plugin as inactive
--  as = string,                 -- Specifies an alias under which to install the plugin
--  installer = function,        -- Specifies custom installer. See "custom installers" below.
--  updater = function,          -- Specifies custom updater. See "custom installers" below.
--  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--  opt = boolean,               -- Manually marks a plugin as optional.
--  bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
--  branch = string,             -- Specifies a git branch to use
--  tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
--  commit = string,             -- Specifies a git commit to use
--  lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--  config = string or function, -- Specifies code to run after this plugin is loaded.
--  -- The setup key implies opt = true
--  setup = string or function,  -- Specifies code to run before this plugin is loaded. The code is ran even if
--                               -- the plugin is waiting for other conditions (ft, cond...) to be met.
--
--  -- The following keys all imply lazy-loading and imply opt = true
--  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--  ft = string or list,         -- Specifies filetypes which load this plugin.
--  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--  event = string or list,      -- Specifies autocommand events which load this plugin.
--  fn = string or list          -- Specifies functions which load this plugin.
--  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                               -- with one of these module names, the plugin will be loaded.
--  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--                               -- requiring a string which matches one of these patterns, the plugin will be loaded.
--}
