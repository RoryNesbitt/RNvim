vim.g.mapleader = " "
vim.o.termguicolors = true
--vim.o.t_Co = '256'
--vim.bo.t_Co = '256'

require("packer-init")
require("options")
require("keybindings")
require("autocmds")
