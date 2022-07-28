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

hydra({
  name = "dap",
  hint = [[ Debugging ]],
  config = { foreign_keys = "run" },
  mode = "n",
  body = "<leader>d",
  heads = {
    { "d", function() require("dap").continue() end, { desc = "Continue" } },
    { "n", function() require("dap").step_into() end, { desc = "Step into" } },
    { "N", function() require("dap").step_over() end, { desc = "over" } },
    { "O", function() require("dap").step_out() end, { desc = "out" } },
    { "b", function() require("dap").toggle_breakpoint() end },
    { "B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end },
    { "L", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
    { "r", function() require("dap").repl.open() end, { desc = "Repl" } },
  }
})
