require"rnvim.options"
require"rnvim.lazy"
require"rnvim.keymaps"
require"rnvim.autocmds"
require"rnvim.colourscheme"

local M = {}

local function randomNum(i)
  math.randomseed(os.clock()*100000000000)
  return math.random(i)
end
M.randomColours = function(show)
  local schemes = vim.fn.getcompletion("", "color")
  local colourScheme = schemes[randomNum(#schemes)]
  if show then
    print(colourScheme)
  end
  pcall(vim.cmd.colorscheme(colourScheme))
  pcall(vim.cmd.highlight("LineNr guibg=none"))
  pcall(vim.cmd.highlight("NonText guibg=none"))
end

M.transparentBackground = function ()
  pcall(vim.cmd.highlight("Normal guibg=none"))
end

return M
