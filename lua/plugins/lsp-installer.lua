local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {capabilities = capabilities}
  if server.name == 'sumneko_lua' then
    opts = vim.tbl_deep_extend('force', {
      settings = {
        Lua = {
          runtime = {
            path = vim.split(package.path, ';')
          },
          diagnostics = {
            globals = {'vim'}
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
          }
        }
      }
    }, opts)
  end
  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
