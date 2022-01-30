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
return packer.startup(function(use)
	--Self manage packer
	use "wbthomason/packer.nvim"
	--Colours
	use {'rose-pine/neovim', as = 'rose-pine', opt = true}
  use {'joshdick/onedark.vim', opt = true}
  use {'gruvbox-community/gruvbox', opt = true}
  use {'shaunsingh/nord.nvim', opt = true}
  use {'folke/tokyonight.nvim', opt = true}
  use {'dracula/vim', as = 'dracula', opt = true}
  use {'tiagovla/tokyodark.nvim', opt = true}
  use {'catppuccin/nvim', as = 'catppuccin', opt = true}
	use { "tomasiser/vim-code-dark", opt = true }
	use {
    "norcalli/nvim-colorizer.lua",
    config = "require('colorizer').setup()",
    event = 'BufRead'
  }
	--Lsp
	use {
    "neovim/nvim-lspconfig",
    config = "require'plugins.lsp'",
    event = 'BufRead'
  }
	use {
    "williamboman/nvim-lsp-installer",
    config = "require'plugins.lsp-installer'",
    --event = 'BufRead'
  }
	use {
    "glepnir/lspsaga.nvim",
    --event = 'BufWinEnter'
  }
	use {
    "simrat39/symbols-outline.nvim",
    --event = 'BufWinEnter'
  }
	--nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    config = "require'plugins.nvim-cmp'",
    --event = 'BufRead'
  }
	use {
    "hrsh7th/cmp-nvim-lsp",
    --event = 'BufWinEnter'
  }
	use {
    "hrsh7th/cmp-buffer",
    after = 'nvim-cmp'
  }
	use {
    "hrsh7th/cmp-path",
    --event = 'BufWinEnter'
  }
	use {
    "hrsh7th/cmp-cmdline",
    --event = 'BufWinEnter'
  }
	use {
    "onsails/lspkind-nvim",
    --event = 'BufWinEnter'
  }
	--snippets
  use {
    "hrsh7th/cmp-vsnip",
    requires = { "hrsh7th/vim-vsnip", opt = true },
    after = 'nvim-cmp'
  }
	use {
    "rafamadriz/friendly-snippets",
    --event = 'BufWinEnter'
  }
	--Treesitter
	use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", config = "require'plugins.treesitter'",
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
	--Telescope
	use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = "require'plugins.telescope'",
  }
	use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = "require('telescope').load_extension 'file_browser'",
    after = "telescope.nvim",
    --event = 'BufRead'
  }
	--Extra info
	use {
    "glepnir/dashboard-nvim",
    config = "require'plugins.dashboard'",
    -- event = 'BufWinEnter'
  }
  use {
    "hoob3rt/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
      event = 'BufRead'
    },
    config = "require'plugins.lualine'",
  }
	use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end,
    event = 'BufWinEnter'
  }
	use {
    "ryanoasis/vim-devicons",
    --event = 'BufWinEnter'
  }
  use {
    "nikvdp/ejs-syntax",
    --event = 'BufWinEnter'
  }
	--git
	use {
    "tpope/vim-fugitive",
    --event = 'BufWinEnter'
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
    "terryma/vim-multiple-cursors",
    --event = 'BufWinEnter'
  }
	use {
    "tpope/vim-surround",
    --event = 'BufWinEnter'
  }
	use {
    "vim-syntastic/syntastic",
    config = "require'plugins.syntastic'",
    --event = 'BufRead'
  }
	use {
    "windwp/nvim-autopairs",
    config = "require'plugins.autopairs'",
    --event = 'BufRead'
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end,
    ----event = 'BufRead'
  }
  use {
    "tpope/vim-repeat",
    config = function()
      vim.cmd([[
      silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
      ]])
    end,
    --event = 'BufWinEnter'
  }
	use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require'plugins.indent-blankline'",
    event = 'BufRead'
  }
	use {
    "jose-elias-alvarez/null-ls.nvim",
    config = "require'plugins.null-ls'",
    --event = 'BufRead'
  }
	--program integration
	use {
    "beeender/Comrade",
    opt = true,
    --event = 'BufRead'
  }
  use {
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
    --event = 'BufWinEnter'
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
    --event = 'BufWinEnter'
  }
  use {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
    --event = 'BufWinEnter'
  }

	--Autoinstall packer if not yet setup
	if Packer_bootstrap then
		require("packer").sync()
	end
end)
