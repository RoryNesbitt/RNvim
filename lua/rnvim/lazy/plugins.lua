return {
  --Colours
  "joshdick/onedark.vim",
  "gruvbox-community/gruvbox",
  "shaunsingh/nord.nvim",
  "tomasiser/vim-code-dark",
  "chriskempson/base16-vim",
  { "dracula/vim", name = "dracula" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup(
        { "*"; }, { mode = "foreground", css = true }
      )
    end
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = {},
  },
  "KabbAmine/vCoolor.vim",
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = {},
  },
  "folke/neodev.nvim",
  --Lsp
  {
    "neovim/nvim-lspconfig",
    config = function() require("rnvim.lsp") end,
  },
  {
    "williamboman/mason.nvim",
    config = function() require("rnvim.mason") end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
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
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason.nvim",
    },
  },
  --Dap
  {
    "mfussenegger/nvim-dap",
    config = function() require("rnvim.dap") end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function() require("rnvim.dapui") end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = {},
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
    config = function() require("telescope").load_extension("dap") end,
  },
  --DAP language adapters
  {
    "jbyuki/one-small-step-for-vimkind",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  --nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    config = function() require("rnvim.nvim-cmp") end,
  },
  {
    "hrsh7th/cmp-buffer",
    dependencies = "nvim-cmp"
  },
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "onsails/lspkind-nvim",
  'saadparwaiz1/cmp_luasnip',
  --Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("rnvim.treesitter") end,
  },
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter"
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter"
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    dependencies = "nvim-treesitter"
  },
  {
    "lewis6991/spellsitter.nvim",
    config = {},
  },
  --Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = function() require("rnvim.telescope") end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function() require("telescope").load_extension "file_browser" end,
    dependencies = "telescope.nvim",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension("ui-select") end,
    dependencies = "telescope.nvim",
  },
  {
    "tsakirist/telescope-lazy.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function() require("telescope").load_extension "lazy" end
  },
  --Extra info
  {
    "glepnir/dashboard-nvim",
    config = function() require("rnvim.dashboard") end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      lazy = true,
    },
    config = function() require("rnvim.lualine") end,
  },
  {
    "folke/which-key.nvim",
    config = {},
  },
  "ryanoasis/vim-devicons",
  "nikvdp/ejs-syntax",
  --git
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function() require("rnvim.neogit") end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("rnvim.diffview") end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    config = {},
  },
  --Functionality
  {
    "anuvyklack/hydra.nvim",
    config = function() require("rnvim.hydra") end
  },
  "terryma/vim-multiple-cursors",
  {
    "windwp/nvim-autopairs",
    config = function() require("rnvim.autopairs") end,
  },
  {
    "numToStr/Comment.nvim",
    config = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("rnvim.indent-blankline") end,
  },
  {
    "sunjon/stylish.nvim",
    config = function()
      -- vim.ui.notify = require("stylish").ui_notification()
      vim.keymap.set(
        "n", "<F12>", function()
          require "stylish".ui_clock()
        end,
        { noremap = true, silent = true }
      )
    end
  },
  {
    "Pocco81/true-zen.nvim",
    config = function() require("rnvim.true-zen") end,
    dependencies = {
      "folke/twilight.nvim",
      config = {},
    },
  },
  {
    "gaoDean/autolist.nvim",
    config = {},
  },
  --program integration
  {
    "aspeddro/pandoc.nvim",
    config = {},
  },
  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function() require("rnvim.firenvim") end,
  },
  {
    "aserowy/tmux.nvim",
    config = function() require("rnvim.tmux") end,
  },
  {
    "stevearc/oil.nvim",
    config = {},
  }
}
