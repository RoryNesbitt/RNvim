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
  use {
    --Self manage packer
    "wbthomason/packer.nvim",
    --Colours
    { 'joshdick/onedark.vim', opt = true },
    { 'gruvbox-community/gruvbox', opt = true },
    { 'shaunsingh/nord.nvim', opt = true },
    { 'dracula/vim', as = 'dracula', opt = true },
    { "tomasiser/vim-code-dark", opt = true },
    { "chriskempson/base16-vim", opt = true },
    {
      "norcalli/nvim-colorizer.lua",
      config = function() require("colorizer").setup() end
    },
    --Lsp
    {
      "neovim/nvim-lspconfig",
      config = function() require("rnvim.lsp") end,
    },
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      config = function() require("rnvim.mason") end,
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
      },
    },
    "glepnir/lspsaga.nvim",
    "simrat39/symbols-outline.nvim",
    --Null-ls
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function() require("rnvim.null-ls") end,
    },
    --Dap
    {
      "mfussenegger/nvim-dap",
      config = function() require("rnvim.dap") end
    },
    {
      "rcarriga/nvim-dap-ui",
      requires = {
        "mfussenegger/nvim-dap",
      },
      config = function() require("rnvim.dapui") end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      requires = {
        "mfussenegger/nvim-dap",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function() require("nvim-dap-virtual-text").setup() end
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      requires = {
        "mfussenegger/nvim-dap",
        "nvim-telescope/telescope.nvim",
      },
      config = function() require("telescope").load_extension('dap') end,
    },
    --nvim-cmp
    {
      "hrsh7th/nvim-cmp",
      config = function() require("rnvim.nvim-cmp") end,
    },
    "hrsh7th/cmp-nvim-lsp",
    {
      "hrsh7th/cmp-buffer",
      after = 'nvim-cmp'
    },
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim",
    --Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    --Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function() require("rnvim.treesitter") end,
    },
    {
      "nvim-treesitter/playground",
      after = 'nvim-treesitter'
    },
    {
      "windwp/nvim-ts-autotag",
      after = 'nvim-treesitter'
    },
    {
      "p00f/nvim-ts-rainbow",
      after = 'nvim-treesitter'
    },
    {
      'lewis6991/spellsitter.nvim',
      config = function() require("spellsitter").setup() end
    },
    --Telescope
    {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim"
      },
      config = function() require("rnvim.telescope") end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      config = function() require("telescope").load_extension "file_browser" end,
      after = "telescope.nvim",
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function() require("telescope").load_extension("ui-select") end
    },
    --Extra info
    {
      "glepnir/dashboard-nvim",
      config = function() require("rnvim.dashboard") end,
    },
    {
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        opt = true,
      },
      config = function() require("rnvim.lualine") end,
    },
    {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end,
    },
    "ryanoasis/vim-devicons",
    "nikvdp/ejs-syntax",
    --git
    "tpope/vim-fugitive",
    {
      'TimUntersberger/neogit',
      requires = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
      },
      config = function() require("rnvim.neogit") end,
    },
    {
      'sindrets/diffview.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      config = function() require("rnvim.diffview") end
    },
    {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim", },
      config = function() require("gitsigns").setup() end,
    },
    --Functionality
    {
      'lewis6991/impatient.nvim',
      config = function() require("impatient").enable_profile() end
    },
    "terryma/vim-multiple-cursors",
    "tpope/vim-surround",
    {
      "vim-syntastic/syntastic",
      config = function() require("rnvim.syntastic") end,
    },
    {
      "windwp/nvim-autopairs",
      config = function() require("rnvim.autopairs") end,
    },
    {
      'numToStr/Comment.nvim',
      config = function()
        require("Comment").setup()
      end,
    },
    {
      "tpope/vim-repeat",
      config = function()
        vim.cmd([[
        silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
        ]])
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function() require("rnvim.indent-blankline") end,
    },
    {
      'sunjon/stylish.nvim',
      config = function()
        -- vim.ui.notify = require('stylish').ui_notification()
        vim.keymap.set(
          'n', '<F12>', function()
            require "stylish".ui_clock()
          end,
          { noremap = true, silent = true }
        )
      end
    },
    --program integration
    {
      "aspeddro/pandoc.nvim",
      config = function() require("pandoc").setup() end
    },
    {
      "glacambre/firenvim",
      run = function()
        vim.fn["firenvim#install"](0)
      end,
      config = function() require("rnvim.firenvim") end,
    },
    {
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
    },
    {
      "iamcco/markdown-preview.nvim",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    --  {
    --    "beeender/Comrade",
    --    requires = {
    --      "Shougo/deoplete.nvim",
    --      run = ':UpdateRemotePlugins',
    --      config = 'call deoplete#enable()'
    --    },
    --  },

  }

  --Autoinstall packer if not yet setup
  if Packer_bootstrap then
    require("packer").sync()
  end
end)
