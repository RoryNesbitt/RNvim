local hydra = require("hydra")

hydra({
    name = "LSP",
    hint = [[LSP controls]], -- multiline string
    config = {...},
    mode = 'n',
    body = '<leader>l',
   heads = {
      --LSP
      { "i", "<cmd>LspInfo<cr>" },
      { "k", function() vim.lsp.buf.signature_help() end },
      { "K", function() vim.lsp.buf.hover() end },
      { "wa", function() vim.lsp.buf.add_workspace_folder() end },
      { "wr", function() vim.lsp.buf.remove_workspace_folder() end },
      { "wi", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "Workspace" } },
      { "t", function() vim.lsp.buf.type_definition() end },
      { "d", function() vim.lsp.buf.definition() end },
      { "D", function() vim.lsp.buf.declaration() end },
      { "r", "<cmd>Telescope lsp_references<cr>" },
      { "R", function() vim.lsp.buf.rename() end },
      { "a", "<cmd>Telescope lsp_code_actions<cr>" },
      { "l", "<cmd>Telescope diagnostics<cr>" },
      { "n", function() vim.diagnostic.goto_next() end },
      { "N", function() vim.diagnostic.goto_prev() end },
   }
})
