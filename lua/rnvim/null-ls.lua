local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({automatic_setup = true})

null_ls.setup({
  sources = {
    -- Anything not supported by mason goes here
  }
})

mason_null_ls.setup_handlers {
  function(source_name, methods)
    -- All sources with no handler get passed here
    vim.tbl_map(function(method)
      null_ls.register(null_ls.builtins[method][source_name])
    end, methods)
  end,

  write_good = function(source_name, methods)
    null_ls.register(null_ls.builtins.diagnostics.write_good.with({
      filetypes = {"markdown", "tex"}
    }))
  end,

  lua_format = function(source_name, methods)
    null_ls.register(null_ls.builtins.formatting.lua_format.with({
      extra_args = {
        "--no-keep-simple-function-one-line", "--no-break-after-operator",
        "--column-limit=80", "--break-after-table-lb", "--indent-width=2"
      }
    }))
  end
}
