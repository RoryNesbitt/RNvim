local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local function cmd(command)
  return table.concat { "<cmd>", command, "<CR>" }
end

local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.

  ["clangd"] = function()
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp", "ino" },
    }
  end,

  ["emmet_ls"] = function()
    lspconfig.emmet_ls.setup {
      on_attach = on_attach,
      default_config = {
        cmd = { "ls_emmet", "--stdio" },
        filetypes = { "html", "typescriptreact", "javascriptreact", "typescript", "javascript", "css", "sass", "scss",
          "less",
          "ejs" },
        root_dir = function(_)
          return vim.loop.cwd()
        end,
        settings = {},
      },
    }
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = vim.split(package.path, ";")
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,

  ["ltex"] = function()
    lspconfig.ltex.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ltex = {
          language = "en",
          disabledRules = { ["en-GB"] = { "OXFORD_SPELLING_NOUNS" } },
        }
      }
    }
  end

}