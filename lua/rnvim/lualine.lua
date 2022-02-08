-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  -- blue = utils.get_highlight("Function").fg,
  cyan   = '#79dac8',
  -- cyan = utils.get_highlight("Special").fg,
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  -- red = utils.get_highlight("DiagnosticError").fg,
  violet = '#d183e8',
  -- purple = utils.get_highlight("Statement").fg,
  grey   = '#303030',
  -- gray = utils.get_highlight("NonText").fg,
  yel = '#ffff00',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey   },
    c = { fg = colors.white, bg = 'none'  },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.yel } },

  inactive = {
    a = { fg = colors.white, bg = 'none' },
    b = { fg = colors.white, bg = 'none' },
    c = { fg = colors.black, bg = 'none' },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
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
