require("tmux").setup({
  navigation = {
    enable_default_keybindings = true,
  },
  resize = {
    enable_default_keybindings = true,
  },
})

vim.keymap.set("i", "<C-h>", function() require("tmux").move_left() end, { noremap = true, silent = true})
vim.keymap.set("i", "<C-j>", function() require("tmux").move_bottom() end, { noremap = true, silent = true})
vim.keymap.set("i", "<C-k>", function() require("tmux").move_top() end, { noremap = true, silent = true})
vim.keymap.set("i", "<C-l>", function() require("tmux").move_right() end, { noremap = true, silent = true})
