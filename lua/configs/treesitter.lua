local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
  return
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 5,
    severity_limit = "Warning",
  },
  update_in_insert = true,
})

--TODO: look in to textObjects
--TODO: look in to move
configs.setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autopairs = {
    enable = true,
  },
}
vim.treesitter.language.register('javascript', 'ejs')
vim.filetype.add {
  extension = {
    ejs = "ejs"
  }
}
