local hydra = require("hydra")

local function cmd(command)
   return table.concat({ '<cmd>', command, '<CR>' })
end

local hint = [[
             LSP

 _i_: info         _K_: description
 _k_: signature    _t_: type def
 _d_: definition   _D_: declaration
 _r_: references   _R_: Rename
 _a_: code actions _l_: diagnostics
 workspace _wa_ add _wr_ remove _wi_ info

   _n_/_N_: goto next/prev      _<Esc>_/_q_
]]

hydra({
  name = "LSP",
  hint = hint,
  config = {
    hint = {
      border = "rounded",
    },
    invoke_on_body = true,
  },
  mode = 'n',
  body = '<leader>l',
  heads = {
    --LSP
    { "i", cmd "LspInfo", { exit = true } },
    { "k", function() vim.lsp.buf.signature_help() end },
    { "K", function() vim.lsp.buf.hover() end, { exit = true } },
    { "wa", function() vim.lsp.buf.add_workspace_folder() end },
    { "wr", function() vim.lsp.buf.remove_workspace_folder() end },
    { "wi", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "Workspace" } },
    { "t", function() vim.lsp.buf.type_definition() end },
    { "d", function() vim.lsp.buf.definition() end },
    { "D", function() vim.lsp.buf.declaration() end },
    { "r", cmd "Telescope lsp_references", { exit = true } },
    { "R", function() vim.lsp.buf.rename() end, { exit = true } },
    { "a", cmd "Telescope lsp_code_actions", { exit = true } },
    { "l", cmd "Telescope diagnostics", { exit = true } },
    { "n", function() vim.diagnostic.goto_next() end },
    { "N", function() vim.diagnostic.goto_prev() end },
    { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    { "<Esc>", nil, { exit = true, nowait = true } },
  }
})

hydra({
  name = "Debugging",
  config = {
    foreign_keys = "run",
    type = "statusline",
    invoke_on_body = true,
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
    { "<Esc>", nil, { exit = true, nowait = true } },
    { "q", nil, { exit = true, nowait = true, desc = "exit" } },
  }
})


local hint = [[
             Telescope

 _f_: filetypes   _b_: buffers
 _o_: old files   _g_: live grep
 _p_: packer      _/_: search in file

 _h_: vim help    _c_: execute command
 _k_: keymaps     _;_: commands history 
 _r_: resume      _?_: search history

 _<Enter>_: Telescope           _<Esc>_/_q_
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
      { "p", cmd "Telescope packer" },
      { "b", cmd "Telescope buffers" },
      { "?", cmd "Telescope search_history",  { desc = "search history" } },
      { ";", cmd "Telescope command_history", { desc = "command-line history" } },
      { "c", cmd "Telescope commands", { desc = "execute command" } },
      { "<Enter>", cmd "Telescope", { exit = true, desc = "list all pickers" } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
   }
})

local hint = [[
 _n_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _N_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 _c_: commit      _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_/_g_: Neogit         _<Esc>_/_q_
]]

hydra({
   name = "Git",
   hint = hint,
   config = {
      buffer = bufnr,
      color = "pink",
      invoke_on_body = true,
      hint = {
         border = "rounded"
      },
      on_enter = function()
         vim.cmd "mkview"
         vim.cmd "silent! %foldopen!"
         vim.bo.modifiable = false
         require("gitsigns").toggle_signs(true)
         require("gitsigns").toggle_linehl(true)
      end,
      on_exit = function()
         local cursor_pos = vim.api.nvim_win_get_cursor(0)
         vim.cmd "loadview"
         vim.api.nvim_win_set_cursor(0, cursor_pos)
         vim.cmd "normal zv"
         require("gitsigns").toggle_signs(false)
         require("gitsigns").toggle_linehl(false)
         require("gitsigns").toggle_deleted(false)
      end,
   },
   mode = {"n","x"},
   body = "<leader>g",
   heads = {
      { "n",
         function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() require("gitsigns").next_hunk() end)
            return "<Ignore>"
         end,
         { expr = true, desc = "next hunk" } },
      { "N",
         function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() require("gitsigns").prev_hunk() end)
            return "<Ignore>"
         end,
         { expr = true, desc = "prev hunk" } },
      { "s", ":Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
      { "u", require("gitsigns").undo_stage_hunk, { desc = "undo last stage" } },
      { "S", require("gitsigns").stage_buffer, { desc = "stage buffer" } },
      { "p", require("gitsigns").preview_hunk, { desc = "preview hunk" } },
      { "d", require("gitsigns").toggle_deleted, { nowait = true, desc = "toggle deleted" } },
      { "b", require("gitsigns").blame_line, { desc = "blame" } },
      { "B", function() require("gitsigns").blame_line{ full = true } end, { desc = "blame show full" } },
      { "/", require("gitsigns").show, { exit = true, desc = "show base file" } }, -- show the base of the file
      { "<Enter>", cmd "Neogit", { exit = true, desc = "Neogit" } },
      { "c", function() require("neogit").open({ "commit" }) end, { exit = true, desc = "Commit" } },
      { "g", cmd "Neogit", { exit = true } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
   }
})
