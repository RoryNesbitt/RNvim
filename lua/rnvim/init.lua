local M = {}

local function randomNum(i)
  math.randomseed(os.clock()*100000000000)
  return math.random(i)
end
M.randomColours = function ()
  local schemes = vim.fn.getcompletion('', 'color')
  local colourScheme = schemes[randomNum(#schemes)]
  print(colourScheme)
  pcall(vim.cmd, "colorscheme "..colourScheme)
  pcall(vim.cmd, "highlight LineNr guibg=none")
  pcall(vim.cmd, "highlight NonText guibg=none")

  function clear_background()
    pcall(vim.cmd, "highlight Normal guibg=none")
    pcall(vim.cmd, "highlight LineNr guibg=none")
  end
end

return M
