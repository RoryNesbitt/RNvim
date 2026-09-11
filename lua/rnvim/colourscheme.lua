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

local default = "base16-material-vivid"
local colourscheme, transparent = read_colourscheme(default)

local function write_colourscheme(name, trans)
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok then return end
  vim.cmd.highlight("LineNr guibg=none")
  vim.cmd.highlight("NonText guibg=none")
  trans = trans or transparent
  if trans then clear_background() end
  local f = io.open(state_file, "w")
  if not f then return end
  f:write(name, "\n", tostring(trans))
  f:close()
end

local function toggle_transparent(overwrite)
  if overwrite ~= nil then
    transparent = overwrite
  else
    transparent = not transparent
  end
  write_colourscheme(vim.g.colors_name, transparent)
end

local function randomNum(i)
  math.randomseed(os.clock() * 100000000000)
  return math.random(i)
end

local function random_colourscheme()
  local schemes = vim.fn.getcompletion("", "color")
  local scheme = schemes[randomNum(#schemes)]
  vim.notify(scheme)
  write_colourscheme(scheme)
end

pcall(vim.cmd.colorscheme, colourscheme)
if transparent then clear_background() end

return {
  save = write_colourscheme,
  toggle = toggle_transparent,
  random = random_colourscheme,
}
