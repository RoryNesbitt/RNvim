local function gh(src)
  return "https://github.com/" .. src
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    local function activate()
      if not ev.data.active then
        vim.cmd.packadd(name)
      end
    end

    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "telescope-fzf-native.nvim" then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    elseif name == "nvim-treesitter" then
      activate()
      vim.cmd("TSUpdate")
    elseif name == "firenvim" then
      activate()
      vim.fn["firenvim#install"](0)
    end
  end,
})

vim.pack.add({

  -- Colours
  gh "chriskempson/base16-vim",

  -- Telescope
  gh "nvim-lua/plenary.nvim",

  gh "nvim-telescope/telescope-fzf-native.nvim",
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
  gh "nvim-treesitter/nvim-treesitter",
  gh "nvim-treesitter/nvim-treesitter-context",
  gh "nvim-treesitter/nvim-treesitter-textobjects",
  gh "windwp/nvim-ts-autotag",
  gh "hiphish/rainbow-delimiters.nvim",

  -- UI
  gh "nvim-tree/nvim-web-devicons",
  gh "nvim-lualine/lualine.nvim",
  gh "folke/which-key.nvim",
  gh "folke/todo-comments.nvim",

  -- Git
  -- gh "nvim-lua/plenary.nvim",
  -- gh "sindrets/diffview.nvim",
  -- gh "nvim-telescope/telescope.nvim",
  gh "NeogitOrg/neogit",
  gh "lewis6991/gitsigns.nvim",

  -- Functionality
  gh "RRethy/vim-illuminate",
  gh "nvimtools/hydra.nvim",
  gh "kylechui/nvim-surround",
  gh "lukas-reineke/indent-blankline.nvim",

  -- Program integration
  gh "aserowy/tmux.nvim",
  gh "glacambre/firenvim",

})

local todo_ok, todo = pcall(require, "todo-comments")
if todo_ok then todo.setup() end
