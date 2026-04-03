local function gh(src)
  return "https://github.com/" .. src
end

vim.pack.add({

  -- Colours
  gh "chriskempson/base16-vim",

  -- Telescope
  gh "nvim-lua/plenary.nvim",
  gh "nvim-telescope/telescope-fzy-native.nvim",
  gh "nvim-telescope/telescope.nvim",
  gh "nvim-telescope/telescope-ui-select.nvim",

  -- LSP
  gh "folke/lazydev.nvim",
  gh "neovim/nvim-lspconfig",
  gh "mason-org/mason.nvim",
  gh "mason-org/mason-lspconfig.nvim",
  gh "creativenull/efmls-configs-nvim",
  gh "nvimdev/lspsaga.nvim",

  -- nvim-cmp
  -- sources
  gh "hrsh7th/cmp-buffer",
  gh "hrsh7th/cmp-path",
  gh "hrsh7th/cmp-cmdline",
  gh "hrsh7th/cmp-nvim-lsp",
  gh "hrsh7th/cmp-nvim-lua",
  gh "onsails/lspkind-nvim",
  -- Snippets
  gh "rafamadriz/friendly-snippets",
  gh "L3MON4D3/LuaSnip",
  gh "saadparwaiz1/cmp_luasnip",
  -- cmp
  gh "hrsh7th/nvim-cmp",
  gh "windwp/nvim-autopairs",

  -- -- DAP
  gh "mfussenegger/nvim-dap",
  gh "nvim-neotest/nvim-nio",
  gh "rcarriga/nvim-dap-ui",
  gh "jay-babu/mason-nvim-dap.nvim",
  -- gh "nvim-treesitter/nvim-treesitter",
  gh "theHamsta/nvim-dap-virtual-text",
  -- gh "nvim-lua/plenary.nvim",
  -- gh "nvim-telescope/telescope.nvim",
  -- gh "nvim-telescope/telescope-dap.nvim",
  -- gh "jbyuki/one-small-step-for-vimkind",

  -- Treesitter
  {
    src = gh "nvim-treesitter/nvim-treesitter",
    version = "main",
    hooks = {
      post_checkout = function() vim.cmd("TSUpdate") end,
      post_update = function() vim.cmd("TSUpdate") end,
    },
  },
  gh "nvim-treesitter/nvim-treesitter-context",
  gh "nvim-treesitter/nvim-treesitter-textobjects",
  gh "windwp/nvim-ts-autotag",
  gh "hiphish/rainbow-delimiters.nvim",

  -- Telescope
  gh "nvim-lua/plenary.nvim",
  gh "nvim-telescope/telescope-fzy-native.nvim",
  gh "nvim-telescope/telescope.nvim",
  gh "nvim-telescope/telescope-ui-select.nvim",

  -- UI
  gh "nvim-tree/nvim-web-devicons",
  gh "nvim-lualine/lualine.nvim",
  gh "folke/which-key.nvim",
  gh "folke/todo-comments.nvim",

  -- Git
  -- gh "nvim-lua/plenary.nvim",
  -- gh "sindrets/diffview.nvim",
  -- gh "nvim-telescope/telescope.nvim",
  -- gh "NeogitOrg/neogit",
  gh "lewis6991/gitsigns.nvim",

  -- Functionality
  gh "RRethy/vim-illuminate",
  gh "nvimtools/hydra.nvim",
  gh "kylechui/nvim-surround",
  gh "lukas-reineke/indent-blankline.nvim",

  -- Program integration
  gh "glacambre/firenvim",
  gh "aserowy/tmux.nvim",

})

local todo_ok, todo = pcall(require, "todo-comments")
if todo_ok then todo.setup() end
