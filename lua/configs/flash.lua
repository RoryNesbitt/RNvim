local status_ok, flash = pcall(require, "flash")
if not status_ok then
  return
end
flash.setup()

local map = vim.keymap.set

map(
  { "n", "x", "o" },
  "s",
  function()
    -- default options: exact mode, multi window, all directions, with a backdrop
    require("flash").jump()
  end,
  { desc = "Flash" }
)
map(
  { "n", "o", "x" },
  "S",
  function()
    -- show labeled treesitter nodes around the cursor
    require("flash").treesitter()
  end,
  { desc = "Flash Treesitter" }
)
map(
  "o",
  "r",
  function()
    -- jump to a remote location to execute the operator
    require("flash").remote()
  end,
  { desc = "Remote Flash" }
)
map(
  { "n", "o", "x" },
  "R",
  function()
    -- show labeled treesitter nodes around the search matches
    require("flash").treesitter_search()
  end,
  { desc = "Treesitter Search" }
)
