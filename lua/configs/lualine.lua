local lualine_ok, lualine = pcall(require, "lualine")
if not (
      lualine_ok
    ) then
  return
end

local getHl = vim.api.nvim_get_hl_by_name
local colours = {
  blue = string.format("#%06x", getHl("Function", true).foreground),
  cyan = string.format("#%06x", getHl("Special", true).foreground),
  black  = "#080808",
  white  = "#c6c6c6",
  red = string.format("#%06x", getHl("DiagnosticError", true).foreground),
  violet = string.format("#%06x", getHl("Statement", true).foreground),
  gray = string.format("#%06x", getHl("NonText", true).foreground),
  green = string.format("#%06x", getHl("String", true).foreground),
  orange = string.format("#%06x", getHl("DiagnosticWarn", true).foreground),
  diag = {
    warn = string.format("#%06x", getHl("DiagnosticWarn", true).foreground),
    error = string.format("#%06x", getHl("DiagnosticError", true).foreground),
    hint = string.format("#%06x", getHl("DiagnosticHint", true).foreground),
    info = string.format("#%06x", getHl("DiagnosticInfo", true).foreground),
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
