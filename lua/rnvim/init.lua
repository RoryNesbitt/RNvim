local M = {}

M.randomColours = function ()
  local colourScheme = 'gruvbox'
  pcall(vim.cmd, "colorscheme "..colourScheme)
  pcall(vim.cmd, "highlight LineNr guibg=none")
  pcall(vim.cmd, "highlight NonText guibg=none")

  function clear_background()
    pcall(vim.cmd, "highlight Normal guibg=none")
    pcall(vim.cmd, "highlight LineNr guibg=none")
  end
end

return M
