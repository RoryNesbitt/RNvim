local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

-- Install the parsers you want
local parsers = {
  "javascript",
  "typescript",
  "html",
  "css",
  "vim",
  "vimdoc",
  "markdown_inline",
  "query",
}

-- Install / update on startup if missing
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-treesitter").install(parsers)
  end,
  once = true, -- only run once per session
})

-- Optional: Auto-install when opening a new filetype
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match) or args.match
    pcall(function()
      require("nvim-treesitter").install({ lang })
    end)
  end,
})

-- Enable core features using built-in Neovim commands
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- Your custom registrations
vim.treesitter.language.register("javascript", "ejs")
vim.filetype.add({ extension = { ejs = "ejs" } })

-- nvim-ts-autotag
local at_ok, autotag = pcall(require, "nvim-ts-autotag")
if at_ok then
  autotag.setup({})
end

local to_ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
if to_ok then
  textobjects.setup {
    select = { lookahead = true },
    move = { set_jumps = true },
  }
  local select = require("nvim-treesitter-textobjects.select")
  local move = require("nvim-treesitter-textobjects.move")
  local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

  -- Select
  vim.keymap.set({ "x", "o" }, "af", function()
    select.select_textobject("@function.outer", "textobjects")
  end, { desc = "outer function" })
  vim.keymap.set({ "x", "o" }, "if", function()
    select.select_textobject("@function.inner", "textobjects")
  end, { desc = "inner function" })
  vim.keymap.set({ "x", "o" }, "ac", function()
    select.select_textobject("@class.outer", "textobjects")
  end, { desc = "outer class" })
  vim.keymap.set({ "x", "o" }, "ic", function()
    select.select_textobject("@class.inner", "textobjects")
  end, { desc = "inner class" })
  vim.keymap.set({ "x", "o" }, "aa", function()
    select.select_textobject("@parameter.outer", "textobjects")
  end, { desc = "outer parameter" })
  vim.keymap.set({ "x", "o" }, "ia", function()
    select.select_textobject("@parameter.inner", "textobjects")
  end, { desc = "inner parameter" })

  -- Move
  vim.keymap.set({ "n", "x", "o" }, "]f", function()
    move.goto_next_start("@function.outer", "textobjects")
  end, { desc = "Next function" })
  vim.keymap.set({ "n", "x", "o" }, "[f", function()
    move.goto_previous_start("@function.outer", "textobjects")
  end, { desc = "Previous function" })
  vim.keymap.set({ "n", "x", "o" }, "]c", function()
    move.goto_next_start("@class.outer", "textobjects")
  end, { desc = "Next class" })
  vim.keymap.set({ "n", "x", "o" }, "[c", function()
    move.goto_previous_start("@class.outer", "textobjects")
  end, { desc = "Previous class" })

  vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
  vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
end
