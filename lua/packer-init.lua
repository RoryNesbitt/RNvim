local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({})
		end,
	},
})

local pluginConf = vim.fn.stdpath('config').."/lua/rnvim/"
return packer.startup(function(use)
	--Self manage packer
	use "wbthomason/packer.nvim"
	--Colours
  use {'joshdick/onedark.vim', opt = true}
  use {'gruvbox-community/gruvbox', opt = true}
  use {'shaunsingh/nord.nvim', opt = true}
  use {'dracula/vim', as = 'dracula', opt = true}
	use { "tomasiser/vim-code-dark", opt = true }
	use { "chriskempson/base16-vim", opt = true }
	use {
    "norcalli/nvim-colorizer.lua",
    config = "require('colorizer').setup()",
    event = 'BufRead'
  }
	--Lsp
	use {
    "neovim/nvim-lspconfig",
    config = "dofile('"..pluginConf.."lsp.lua')",
  }
  use {
    "williamboman/mason.nvim"
  }
	use {
    "williamboman/mason-lspconfig.nvim",
    config = "dofile('"..pluginConf.."mason.lua')",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
  }
	use {
    "glepnir/lspsaga.nvim",
  }
	use {
    "simrat39/symbols-outline.nvim",
  }
  --Dap
  use {
    "mfussenegger/nvim-dap",
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
    },
    config = "require('dapui').setup()",
  }
  use {
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = "require('nvim-dap-virtual-text').setup()"
  }
  use {
    "nvim-telescope/telescope-dap.nvim",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
    config = "require('telescope').load_extension('dap')",
  }
	--nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    config = "dofile('"..pluginConf.."nvim-cmp.lua')",
  }
	use {
    "hrsh7th/cmp-nvim-lsp",
  }
	use {
    "hrsh7th/cmp-buffer",
    after = 'nvim-cmp'
  }
	use {
    "hrsh7th/cmp-path",
  }
	use {
    "hrsh7th/cmp-cmdline",
  }
	use {
    "onsails/lspkind-nvim",
  }
	--snippets
  -- use {
  --   "hrsh7th/cmp-vsnip",
  --   requires = { "hrsh7th/vim-vsnip", opt = true },
  --   after = 'nvim-cmp'
  -- }
  use {
    "L3MON4D3/LuaSnip",
  }
	use {
    "rafamadriz/friendly-snippets",
  }
	--Treesitter
	use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", config = "dofile('"..pluginConf.."treesitter.lua')",
    event = 'BufWinEnter'
  }
	use {
    "nvim-treesitter/playground",
    after = 'nvim-treesitter'
  }
	use {
    "windwp/nvim-ts-autotag",
    after = 'nvim-treesitter'
  }
	use {
    "p00f/nvim-ts-rainbow",
    after = 'nvim-treesitter'
  }
  use {
    'lewis6991/spellsitter.nvim',
    config = "require('spellsitter').setup()"
  }
	--Telescope
	use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = "dofile('"..pluginConf.."telescope.lua')",
  }
	use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = "require('telescope').load_extension 'file_browser'",
    after = "telescope.nvim",
  }
	--Extra info
	use {
    "glepnir/dashboard-nvim",
    config = "dofile('"..pluginConf.."dashboard.lua')",
    event = 'BufWinEnter'
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
      event = 'BufRead'
    },
    config = "dofile('"..pluginConf.."lualine.lua')",
  }
  -- use {
  --   "rebelot/heirline.nvim",
  --   requires = {
  --     "kyazdani42/nvim-web-devicons",
  --     opt = true,
  --     event = "BufRead",
  --     after = 'vim-devicons',
  --   },
  --   config = "dofile('"..pluginConf.."statusline/init.lua')"
  -- }
	use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end,
    event = 'BufWinEnter'
  }
	use {
    "ryanoasis/vim-devicons",
  }
  use {
    "nikvdp/ejs-syntax",
  }
	--git
	use {
    "tpope/vim-fugitive",
  }
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = "dofile('"..pluginConf.."neogit.lua')",
  }
  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = "dofile('"..pluginConf.."diffview.lua')"
  }
	--use 'airblade/vim-gitgutter'
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim", },
    config = "require('gitsigns').setup()",
    event = 'BufRead'
  }
	--Functionality
  use {
    'lewis6991/impatient.nvim',
    config = "require'impatient'.enable_profile()"
  }
	use {
    "terryma/vim-multiple-cursors",
  }
	use {
    "tpope/vim-surround",
  }
	use {
    "vim-syntastic/syntastic",
    config = "dofile('"..pluginConf.."syntastic.lua')",
  }
	use {
    "windwp/nvim-autopairs",
    config = "dofile('"..pluginConf.."autopairs.lua')",
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end,
  }
  use {
    "tpope/vim-repeat",
    config = function()
      vim.cmd([[
      silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
      ]])
    end,
  }
	use {
    "lukas-reineke/indent-blankline.nvim",
    config = "dofile('"..pluginConf.."indent-blankline.lua')",
    event = 'BufRead'
  }
	use {
    "jose-elias-alvarez/null-ls.nvim",
    config = "dofile('"..pluginConf.."null-ls.lua')",
  }
  use {
    'sunjon/stylish.nvim',
    config = function ()
      -- vim.ui.notify = require('stylish').ui_notification()
      vim.keymap.set(
        'n', '<F12>', function()
          require"stylish".ui_clock()
        end,
        { noremap = true, silent = true }
      )
    end
  }
	--program integration
  use {
    "aspeddro/pandoc.nvim",
    config = "require('pandoc').setup()"
  }
	-- use {
 --    "beeender/Comrade",
 --    requires = {
 --      "Shougo/deoplete.nvim",
 --      run = ':UpdateRemotePlugins',
 --      config = 'call deoplete#enable()'
 --    },
 --  }
  use {
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
    config = "vim.cmd('source "..pluginConf.."firen.vim')",
  }
  use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      })
    end,
  }
  use {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  }

	--Autoinstall packer if not yet setup
	if Packer_bootstrap then
		require("packer").sync()
	end
end)
