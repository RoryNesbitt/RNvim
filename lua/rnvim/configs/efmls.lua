local efm_ls_ok, efm_ls_defaults = pcall(require, "efmls-configs.defaults")
if not efm_ls_ok then
  return
end

local efm_languages = efm_ls_defaults.languages()
efm_languages = vim.tbl_extend('force', efm_languages, {
  sh = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.shfmt'),
  },
  zsh = {
    require('efmls-configs.formatters.shfmt'),
  },
})

vim.lsp.config.efm = {
  filetypes = vim.tbl_keys(efm_languages),
  settings = {
    rootMarkers = { ".git/" },
    languages = efm_languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}
