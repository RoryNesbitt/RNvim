local hydra = require("hydra")

local function cmd(command)
   return table.concat({ '<cmd>', command, '<CR>' })
end

hydra({
  name = "LSP",
  hint = [[LSP controls]], -- multiline string
  config = {
    hint = {
      border = "rounded",
    },
  },
  mode = 'n',
  body = '<leader>l',
  heads = {
    --LSP
    { "i", cmd "LspInfo" },
    { "k", function() vim.lsp.buf.signature_help() end },
    { "K", function() vim.lsp.buf.hover() end },
    { "wa", function() vim.lsp.buf.add_workspace_folder() end },
    { "wr", function() vim.lsp.buf.remove_workspace_folder() end },
    { "wi", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "Workspace" } },
    { "t", function() vim.lsp.buf.type_definition() end },
    { "d", function() vim.lsp.buf.definition() end },
    { "D", function() vim.lsp.buf.declaration() end },
    { "r", cmd "Telescope lsp_references" },
    { "R", function() vim.lsp.buf.rename() end },
    { "a", cmd "Telescope lsp_code_actions" },
    { "l", cmd "Telescope diagnostics" },
    { "n", function() vim.diagnostic.goto_next() end },
    { "N", function() vim.diagnostic.goto_prev() end },
  }
})

hydra({
  name = "Debugging",
  config = {
    foreign_keys = "run",
    type = "statusline",
  },
  mode = "n",
  body = "<leader>d",
  heads = {
    { "d", function() require("dap").continue() end, { desc = "Continue" } },
    { "n", function() require("dap").step_into() end, { desc = "Step into" } },
    { "N", function() require("dap").step_over() end, { desc = "Step over" } },
    { "O", function() require("dap").step_out() end, { desc = "Step out" } },
    { "b", function() require("dap").toggle_breakpoint() end, { desc = "Breakpoint" } },
    { "B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Conditional breakpoint" } },
    { "L", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end, { desc = "Log point" } },
    { "r", function() require("dap").repl.open() end, { desc = "Repl" } },
  }
})


local hint = [[
             Telescope

 _f_: filetypes   _b_: buffers
 _o_: old files   _g_: live grep
 _/_: search in file

 _h_: vim help    _c_: execute command
 _k_: keymaps     _;_: commands history 
 _r_: resume      _?_: search history

 _<Enter>_: Telescope           _<Esc>_
]]

hydra({
   name = "Telescope",
   hint = hint,
   config = {
      color = "teal",
      invoke_on_body = true,
      hint = {
         position = "middle",
         border = "rounded",
      },
   },
   mode = "n",
   body = "<Leader>t",
   heads = {
      { "f", cmd "Telescope filetypes" },
      { "g", cmd "Telescope live_grep" },
      { "o", cmd "Telescope oldfiles", { desc = "recently opened files" } },
      { "h", cmd "Telescope help_tags", { desc = "vim help" } },
      { "k", cmd "Telescope keymaps" },
      { "r", cmd "Telescope resume" },
      { "/", function()
        require("telescope.builtin").current_buffer_fuzzy_find({
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
          previewer = false,
        })
      end , { desc = "search in file" } },
      { "b", cmd "Telescope buffers" },
      { "?", cmd "Telescope search_history",  { desc = "search history" } },
      { ";", cmd "Telescope command_history", { desc = "command-line history" } },
      { "c", cmd "Telescope commands", { desc = "execute command" } },
      { "<Enter>", cmd "Telescope", { exit = true, desc = "list all pickers" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
   }
})
