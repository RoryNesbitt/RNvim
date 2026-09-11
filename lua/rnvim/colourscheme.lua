-- local colorscheme = "base16-material-vivid"
local colorscheme = "base16-gruvbox-dark-soft"

pcall(vim.cmd("silent! colorscheme "..colorscheme))

vim.cmd([[
  highlight Normal guibg=none
  highlight LineNr guibg=none
  highlight WinSeparator guibg=none
  " highlight ColorColumn ctermbg=8
  " highlight NonText guibg=none
  " highlight CursorLine ctermbg=black cterm=bold
  " highlight Cursorcolumn ctermbg=black cterm=bold
]])
