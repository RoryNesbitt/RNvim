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
  --Lsp
  {
    "folke/lazydev.nvim",
    config = function() require("lazydev").setup({
      library = { "nvim-dap-ui" },
    }) end,
  },
  "neovim/nvim-lspconfig",
  {
    "mason-org/mason.nvim",
    config = function() require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }) end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function() require("mason-lspconfig").setup({
      ensure_installed = {
        "efm",
      },
    }) end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
  },
  {
    "creativenull/efmls-configs-nvim",
    config = function() require("configs.efmls") end,
  },
  {
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup()
    end,
  },
  --nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    config = function() require("configs.nvim-cmp") end,
    event = { "BufReadPre", "BufNewFile" },
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
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
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
      "nvim-neotest/nvim-nio",
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
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = "*",
    lazy = false,
    config = function() require("configs.treesitter") end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context", --TODO: add keybindings
      "windwp/nvim-ts-autotag",
      "hiphish/rainbow-delimiters.nvim",
    },
  },
  --Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
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
    event = 'VimEnter',
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
    event = "VeryLazy",
    opts = {},
  },
  --git
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
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
    config = function()
      require("notify").setup({
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
      "rcarriga/nvim-notify",
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
    "nvimtools/hydra.nvim",
    config = function() require("configs.hydra") end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
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
    event = "VeryLazy",
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
    "glacambre/firenvim",
    build = "call: firenvim#install(0)",
    config = function() require("configs.firenvim") end,
  },
  {
    "aserowy/tmux.nvim",
    config = function() require("configs.tmux") end,
  },
    -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require("configs.copilot") end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "hrsh7th/nvim-cmp",
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken", -- Only on MacOS or Linux
  },
}
