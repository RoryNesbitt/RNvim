local flash_ok, flash = pcall(require, "flash")
if not (
  flash_ok
  ) then
  return
end

flash.setup{}
local map = vim.keymap.set

map({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash" })
map({ "n", "o", "x" }, "S", function() flash.treesitter() end, { desc = "Flash Treesitter" })

map("o", "r", function() flash.remote() end, { desc = "Remote Flash" })
map({ "n", "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Treesitter Search" })

map({ "c" }, "<c-s>", function() flash.toggle() end, { desc = "Toggle Flash Search" })

