local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

null_ls.setup {
  sources = {
    -- Anything not supported by mason goes here
  }
}

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then return end

mason_null_ls.setup {
  automatic_setup = true,
  handlers = {
    function(source_name, methods)
      -- All sources with no handler get passed here
      require("mason-null-ls.automatic_setup")(source_name, methods)
    end,

    write_good = function(source_name, methods)
      null_ls.register(null_ls.builtins.diagnostics.write_good.with {
        filetypes = { "markdown", "tex" }
      })
    end,

    lua_format = function(source_name, methods)
      null_ls.register(null_ls.builtins.formatting.lua_format.with {
        extra_args = {
          "--no-keep-simple-function-one-line", "--no-break-after-operator",
          "--column-limit=80", "--break-after-table-lb", "--indent-width=2"
        }
      })
    end
  }
}
