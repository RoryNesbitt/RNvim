local ll_ok, lualine = pcall(require, "lualine")
if not ll_ok then
  return
end

local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return "@" .. reg
end

lualine.setup {
  options = {
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "TelescopePrompt" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "tabs",
        mode = 1,
        show_modified_status = true,
      },
    },
    lualine_x = { macro_recording },
    lualine_y = { "lsp_status", "filetype" },
    lualine_z = { "location" },
  },
}
