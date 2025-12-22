vim.lsp.config.emmet_ls = {
  default_config = {
    cmd = { "ls_emmet", "--stdio" },
    filetypes = { "html", "typescriptreact", "javascriptreact", "typescript", "javascript", "css", "sass", "scss",
    "less",
    "ejs" },
    root_dir = function(_)
      return vim.uv.cwd()
    end,
    settings = {},
  },
}

