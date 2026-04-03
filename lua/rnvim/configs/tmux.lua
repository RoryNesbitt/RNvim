local tmux_ok, tmux = pcall(require, "tmux")
if not tmux_ok then
  return
end

tmux.setup {
  copy_sync = {
    enable = false,
  },
}

vim.keymap.set("i", "<C-h>", function() tmux.move_left() end, { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", function() tmux.move_bottom() end, { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", function() tmux.move_top() end, { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", function() tmux.move_right() end, { noremap = true, silent = true })
