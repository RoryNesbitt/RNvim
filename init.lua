vim.g.mapleader = " "
vim.o.termguicolors = true
--vim.o.t_Co = '256'
--vim.bo.t_Co = '256'
local confDir = vim.fn.stdpath('config')..'/lua/'
dofile(confDir.."packer-init.lua")
dofile(confDir.."options.lua")
dofile(confDir.."keybindings.lua")
dofile(confDir.."autocmds.lua")
dofile(confDir.."colourscheme.lua")
require('rnvim').randomColours()
