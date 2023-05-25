return {
  --Colours
  "joshdick/onedark.vim",
  "gruvbox-community/gruvbox",
  "shaunsingh/nord.nvim",
  "tomasiser/vim-code-dark",
  "chriskempson/base16-vim",
  { "dracula/vim", name = "dracula" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
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
    config = function() require("configs.lsp") end,
  },
  {
    "williamboman/mason.nvim",
    config = function() require("configs.mason") end,
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
    config = function() require("configs.null-ls") end,
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
    config = function() require("configs.dap") end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function() require("configs.dapui") end,
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
    config = function() require("configs.nvim-cmp") end,
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
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("configs.treesitter") end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter"
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
  --Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = function() require("configs.telescope") end,
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
    config = function() require("configs.dashboard") end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
    config = function() require("configs.lualine") end,
  },
  {
    "folke/which-key.nvim",
    config = {},
  },
  "nikvdp/ejs-syntax",
  --git
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function() require("configs.neogit") end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("configs.diffview") end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    config = {},
  },
  --Functionality
  "RRethy/vim-illuminate",
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      vim.notify = require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      lazy = true
    },
    opts = {
      cmdline = {
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  {
    "anuvyklack/hydra.nvim",
    config = function() require("configs.hydra") end
  },
  "terryma/vim-multiple-cursors",
  {
    "windwp/nvim-autopairs",
    config = function() require("configs.autopairs") end,
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
    config = function() require("configs.indent-blankline") end,
  },
  {
    "Pocco81/true-zen.nvim",
    config = function() require("configs.true-zen") end,
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
    config = function() require("configs.firenvim") end,
  },
  {
    "aserowy/tmux.nvim",
    config = function() require("configs.tmux") end,
  },
}
