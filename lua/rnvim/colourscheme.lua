local state_file = vim.fs.joinpath(vim.fn.stdpath("state"), "local-colourscheme")

local function read_colourscheme(default)
  local f = io.open(state_file, "r")
  if f then
    local name = f:read("*l")
    local transparent = (f:read("*l") == "true")
    f:close()
    if name and name ~= "" then
      return name, transparent
    end
  end
  return default, true
end

local function clear_background()
  vim.cmd([[
    highlight Normal guibg=none
    highlight LineNr guibg=none
    highlight WinSeparator guibg=none
  ]])
end

local function write_colourscheme(name, transparent)
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok then return end
  if transparent then clear_background() end
  local f = io.open(state_file, "w")
  if not f then return end
  f:write(name, "\n", tostring(transparent))
  f:close()
end

local default = "base16-material-vivid"
local colourscheme, transparent = read_colourscheme(default)
pcall(vim.cmd.colorscheme, colourscheme)
if transparent then clear_background() end

return {
  save = write_colourscheme,
  clear = function()
    write_colourscheme(vim.g.colors_name, true)
  end,
}
