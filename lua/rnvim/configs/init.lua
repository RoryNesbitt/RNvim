-- load all plugin configs
local module_name = ...
local path = debug.getinfo(1, "S").source:match("@(.*/)")
local pattern = path .. "*.lua"
local files = vim.fn.glob(pattern, false, true)

for _, filepath in ipairs(files) do
  local filename = vim.fn.fnamemodify(filepath, ":t:r")
  if filename ~= "init" then
    require(module_name .. "." .. filename)
  end
end

