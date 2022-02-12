local confDir = vim.fn.stdpath('config')..'/lua/'
dofile(confDir.."packer-init.lua")
dofile(confDir.."options.lua")
dofile(confDir.."keybindings.lua")
dofile(confDir.."autocmds.lua")
require('rnvim').randomColours()
