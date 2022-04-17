-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

local getHl = vim.api.nvim_get_hl_by_name
local colors = {
  blue = getHl("Function", true).foreground,
  cyan = getHl("Special", true).foreground,
  black  = '#080808',
  white  = '#c6c6c6',
  red = getHl("DiagnosticError", true).foreground,
  violet = getHl("Statement", true).foreground,
  gray = getHl("NonText", true).foreground,
  green = getHl("String", true).foreground,
  orange = getHl("DiagnosticWarn", true).foreground,
  diag = {
    warn = getHl("DiagnosticWarn", true).foreground,
    error = getHl("DiagnosticError", true).foreground,
    hint = getHl("DiagnosticHint", true).foreground,
    info = getHl("DiagnosticInfo", true).foreground,
  },
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = string.format("#%06x", colors.violet) },
    b = { fg = colors.white, bg = string.format("#%06x", colors.gray)   },
    c = { fg = colors.white, bg = 'none'  },
  },

  insert = { a = { fg = colors.black, bg = string.format("#%06x", colors.blue) } },
  visual = { a = { fg = colors.black, bg = string.format("#%06x", colors.cyan) } },
  replace = { a = { fg = colors.black, bg = string.format("#%06x", colors.red) } },
  command = { a = { fg = colors.black, bg = string.format("#%06x", colors.green) } },

  inactive = {
    a = { fg = colors.white, bg = 'none' },
    b = { fg = colors.white, bg = 'none' },
    c = { fg = colors.black, bg = 'none' },
  },
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
    lualine_c = { 'buffers', },
    lualine_x = { 'diagnostics', },
    lualine_y = { 'branch', 'filetype', },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
