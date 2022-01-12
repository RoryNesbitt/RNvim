local opts = { noremap = true }
local silentOpts = { noremap = true, silent = true }

--colorizer
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup()

--vim-repeat
vim.cmd([[
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
]])

--gitsigns
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup()

--markdown-preview
vim.g.mkdp_auto_start = 1
