local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier, formatting.black, formatting.gofmt, formatting.shfmt,
    formatting.clang_format, formatting.cmake_format, formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=80', '--break-after-table-lb', '--indent-width=2'
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  }
})
