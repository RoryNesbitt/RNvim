local indent_ok, indent_blankline = pcall(require, "ibl")
if not (
      indent_ok
    ) then
    print("1")
  return
end

local treesitter_exists, _ = pcall(require, "nvim-treesitter")
indent_blankline.setup {}
indent_blankline.overwrite {
  exclude = {
    buftypes = { "terminal" },
    filetypes = {
      "dashboard",
      "NvimTree",
      "hydra_hint"
    },
  },
  scope = {
    enabled = treesitter_exists,
  },
}
