local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. "not found.")
	return
end

vim.cmd("colorscheme gruvbox")
--vim.g.airline_theme = 'gruvbox'

vim.cmd([[au VimEnter * highlight ColorColumn ctermbg=8]])
vim.cmd([[au VimEnter * highlight Normal guibg=none]])
vim.cmd([[au VimEnter * highlight NonText guibg=none]])

--Marks trailing whitespace as an warning
vim.cmd([[
match errorMsg /\s\+$/
]])
