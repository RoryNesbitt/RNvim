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
	use("wbthomason/packer.nvim")
	--Colours
	use({ "morhetz/gruvbox", config = "require'colourscheme'" })
	use("tomasiser/vim-code-dark")
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" })
	--Lsp
	use({ "neovim/nvim-lspconfig", config = "require'plugins.lsp'" })
	use({ "williamboman/nvim-lsp-installer", config = "require'plugins.lsp-installer'" })
	use("glepnir/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim", config = "require('telescope').load_extension 'file_browser'" })
	--nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use({ "hrsh7th/nvim-cmp", config = "require'plugins.nvim-cmp'" })
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind-nvim")
	--snippets
	use({
		"hrsh7th/cmp-vsnip",
		requires = { "hrsh7th/vim-vsnip", opt = true },
	})
	use("rafamadriz/friendly-snippets")
	--Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = "require'plugins.treesitter'" })
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	--Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope.nvim", config = "require'plugins.telescope'" })
	use("nvim-telescope/telescope-fzy-native.nvim")
	--Extra info
	use({ "glepnir/dashboard-nvim", config = "require'plugins.dashboard'" })
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = "require'plugins.lualine'",
	})
	use("liuchengxu/vim-which-key")
	use("ryanoasis/vim-devicons")
  use("nikvdp/ejs-syntax")
	--git
	use("tpope/vim-fugitive")
	--use 'airblade/vim-gitgutter'
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = "require('gitsigns').setup()",
		-- tag = 'release' -- To use the latest release
	})
	--Functionality
	use("terryma/vim-multiple-cursors")
	use("tpope/vim-surround")
	use({ "vim-syntastic/syntastic", config = "require'plugins.syntastic'" })
	use({ "windwp/nvim-autopairs", config = "require'plugins.autopairs'" })
  use {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end}
	use({
		"tpope/vim-repeat",
		config = function()
			vim.cmd([[
      silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
      ]])
		end,
	})
	use({ "lukas-reineke/indent-blankline.nvim", config = "require'plugins.indent-blankline'" })
	use({ "jose-elias-alvarez/null-ls.nvim", config = "require'plugins.null-ls'" })
	--program integration
	use({ "beeender/Comrade", opt = true })
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use({
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
	})
	use({
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	})

	--Autoinstall packer if not yet setup
	if Packer_bootstrap then
		require("packer").sync()
	end
end)
