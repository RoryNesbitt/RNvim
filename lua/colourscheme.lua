local colorscheme = "base16-material-vivid"

pcall(vim.cmd, "colorscheme " .. colorscheme)

vim.cmd([[
  highlight Normal guibg=none
  highlight LineNr guibg=none
  highlight WinSeparator guibg=none
  " highlight ColorColumn ctermbg=8
  " highlight NonText guibg=none
  " highlight CursorLine ctermbg=black cterm=bold
  " highlight Cursorcolumn ctermbg=black cterm=bold
  highlight TrailingSpace gui=undercurl
  match TrailingSpace /\s\+$/
]])
