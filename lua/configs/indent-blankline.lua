local indent_ok, indent_blankline = pcall(require, "indent_blankline")
if not (
      indent_ok
    ) then
  return
end

treesitter_exists, _ = pcall(require, "nvim-treesitter")
indent_blankline.setup {
  buftype_exclude = { "terminal" },
  filetype_exclude = { "dashboard", "NvimTree" },
  show_current_context = treesitter_exists,
}
