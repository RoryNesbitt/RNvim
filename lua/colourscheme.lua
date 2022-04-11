local colorscheme = "base16-gruvbox-dark-hard"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	-- vim.notify("Colorscheme: " .. colorscheme .. " not found.")
	-- return
end

vim.cmd([[
  au VimEnter * highlight ColorColumn ctermbg=8
  au VimEnter * highlight Normal guibg=none
  au VimEnter * highlight NonText guibg=none
  au VimEnter * highlight LineNr guibg=none
  highlight CursorLine ctermbg=black cterm=bold
  highlight Cursorcolumn ctermbg=black cterm=bold
  highlight TrailingSpace gui=undercurl
  match TrailingSpace /\s\+$/
]])
