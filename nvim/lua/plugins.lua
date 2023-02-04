-- https://github.com/wbthomason/packer.nvim#requirements for config
-- :PackerInstall
-- :PackerSync
return require('packer').startup(function()

  -- Simple plugins can be specified as strings
  use 'wbthomason/packer.nvim'
  use 'mfussenegger/nvim-dap'
  --use 'rcarriga/nvim-dap-ui'
  use 'lambdalisue/suda.vim' -- write sudo if not in sudo
  --use 'alx741/vinfo' -- vim GNU info implementation
  use 'HiPhish/info.vim' -- vim GNU info implementation
  use 'linty-org/readline.nvim' -- readline navigation for :, / or ?
  use 'folke/tokyonight.nvim' -- tokyo theme
  use 'shaunsingh/nord.nvim' -- nord theme
  use 'mbbill/undotree' -- undo any history
  --use 'edluffy/hologram.nvim' -- images in nvim
  --use 'rstacruz/vim-closer' -- autobracket enter ...problem with COQ
  use 'uga-rosa/ccc.nvim' -- color picker with :CccPick 
  use 'lervag/vimtex' -- latex thingi...




  -- Commands with simple config
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  --use 'ellisonleao/glow.nvim' -- highlight marker, markdown files etc
  use{
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
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
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

  use { -- git time stamps
    'lewis6991/gitsigns.nvim',
    requires = {"nvim-lua/plenary.nvim"},
    config = function() require('gitsigns').setup() end
  }

  use {  -- highlight fF colors
    'kevinhwang91/nvim-fFHighlight',
    config = function() require('fFHighlight').setup() end
  }

--  use {
--    'Pocco81/HighStr.nvim', -- highlight string colors
--	    config = function()
--		require('high-str').setup({
--		verbosity = 0,
--		saving_path = "/tmp/highstr/",
--		highlight_colors = {
--			-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
--			color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
--			color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
--			color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
--			color_3 = {"#8A2BE2", "smart"},	-- Proton purple
--			color_4 = {"#FF4500", "smart"},	-- Orange red
--			color_5 = {"#008000", "smart"},	-- Office green
--			color_6 = {"#0000FF", "smart"},	-- Just blue
--			color_7 = {"#FFC0CB", "smart"},	-- Blush pink
--			color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
--			color_9 = {"#7d5c34", "smart"},	-- Fallow brown
--		    }
--		})
--	    end
--  }



  -- Plugins can have dependencies on other plugins
  use { -- lsp server
    "williamboman/mason.nvim",
    requires = {
	{'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
	{'mfussenegger/nvim-lint'},
	{'mhartington/formatter.nvim'},
    },
  }

  -- Rust config start
  --use {
  --  'simrat39/rust-tools.nvim'
  --  requires = {"nvim-lua/plenary.nvim"},
  --}
  -- Rust config end

  --  not working with COQ
  --use { -- hint for functions
  --  'ray-x/lsp_signature.nvim'
  --}

  use { -- COQ
    'neovim/nvim-lspconfig',
    requires = {
	{'ms-jpq/coq_nvim', branch = 'coq'},
	{'ms-jpq/coq.artifacts', branch = 'artifacts'},
    },
  }

  use { -- fancy line
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { -- fancy startup screen. Telescope >> fancy fuzyfinder 
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  }

  -- Post-install/update hook with neovim command
  use { -- highlight code
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
	  require('nvim-treesitter.configs').setup {
	  indent = {
	    enable = true
	  }
	}
      end
  }

end)
