local lualine_ok, lualine = pcall(require, "lualine")
if not (
      lualine_ok
    ) then
  return
end

local getHl = vim.api.nvim_get_hl
local colours = {
  blue = string.format("#%06x", getHl(0, {name = "Function"}).fg),
  cyan = string.format("#%06x", getHl(0, {name = "Special"}).fg),
  black  = "#080808",
  white  = "#c6c6c6",
  red = string.format("#%06x", getHl(0, {name = "DiagnosticError"}).fg),
  violet = string.format("#%06x", getHl(0, {name = "Statement"}).fg),
  gray = string.format("#%06x", getHl(0, {name = "NonText"}).fg),
  green = string.format("#%06x", getHl(0, {name = "String"}).fg),
  orange = string.format("#%06x", getHl(0, {name = "DiagnosticWarn"}).fg),
  diag = {
    warn = string.format("#%06x", getHl(0, {name = "DiagnosticWarn"}).fg),
    error = string.format("#%06x", getHl(0, {name = "DiagnosticError"}).fg),
    hint = string.format("#%06x", getHl(0, {name = "DiagnosticHint"}).fg),
    info = string.format("#%06x", getHl(0, {name = "DiagnosticInfo"}).fg),
  },
}

local auto = {
  normal = {
    a = { fg = colours.black, bg = colours.violet },
    b = { fg = colours.white, bg = colours.gray },
    c = { fg = colours.white, bg = colours.black },
  },

  insert = { a = { fg = colours.black, bg = colours.blue } },
  visual = { a = { fg = colours.black, bg = colours.cyan } },
  replace = { a = { fg = colours.black, bg = colours.red } },
  command = { a = { fg = colours.black, bg = colours.green } },
}

lualine.setup {
  options = {
    theme = auto,
    component_separators = {left = "", right = ""},
    section_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { "mode", right_padding = 2 },
    },
    lualine_b = {
      {
        "tabs",
        mode = 1,
        tabs_color = {
          inactive = { fg = colours.white, bg = colours.black },
        },
      }
    },
    lualine_c = {
      {
        function() return require("nvim-navic").get_location() end,
        cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        symbols = { error = " ", warn = " ", hint = " ", info = " " },
      },
      -- stylua: ignore
      {
        function() return require("noice").api.status.command.get() end,
        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
      },
      -- stylua: ignore
      {
        function() return require("noice").api.status.mode.get() end,
        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
      },
      -- stylua: ignore
      {
        function() return "  " .. require("dap").status() end,
        cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
      },
      { require("lazy.status").updates, cond = require("lazy.status").has_updates },
    },
    lualine_y = { "branch", "filetype", },
    lualine_z = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
  },
--  
--  
  tabline = {},
  winbar = {},
  extensions = { "lazy" },
}
