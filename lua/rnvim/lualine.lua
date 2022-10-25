local getHl = vim.api.nvim_get_hl_by_name
local colours = {
  blue = string.format("#%06x", getHl("Function", true).foreground),
  cyan = string.format("#%06x", getHl("Special", true).foreground),
  black  = '#080808',
  white  = '#c6c6c6',
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

require('lualine').setup {
  options = {
    theme = auto,
    component_separators = '|',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', },
    lualine_c = { 'tabs', },
    lualine_x = { 'diagnostics', },
    lualine_y = { 'branch', 'filetype', },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  tabline = {},
  winbar = {},
  extensions = {},
}
