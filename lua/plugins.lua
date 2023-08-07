return {
  --Colours
  "chriskempson/base16-vim",
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
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
    opts = {},
  },
  "KabbAmine/vCoolor.vim",
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
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
    opts = {},
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
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
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "onsails/lspkind-nvim",
        'saadparwaiz1/cmp_luasnip',
      },
  },
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
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
      "mrjones2014/nvim-ts-rainbow",
    },
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
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension("ui-select") end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "tsakirist/telescope-lazy.nvim",
    config = function() require("telescope").load_extension "lazy" end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  --Extra info
  "creativenull/dotfyle-metadata.nvim",
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
    opts = {},
  },
  --git
  {
    "NeogitOrg/neogit",
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
    opts = {},
  },
  --Functionality
  "RRethy/vim-illuminate",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function() require("configs.flash") end
  },
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
      local status_ok, ts = pcall(require, "telescope")
      if status_ok then
        ts.load_extension "notify"
      end
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
    dependencies = {
      "hrsh7th/nvim-cmp",
    }
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
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
    },
  },
  {
    "gaoDean/autolist.nvim",
    opts = {},
  },
  --program integration
  {
    "meatballs/notebook.nvim",
    config = function() require("configs.ipynb") end,
    dependencies = {
      {
        "meatballs/magma-nvim",
        build = ":UpdateRemotePlugins",
      }
    }
  },
  {
    "aspeddro/pandoc.nvim",
    opts = {},
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
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    config = function ()
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup()
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      }
    },
  },
}
