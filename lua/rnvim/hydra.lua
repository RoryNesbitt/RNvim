local hydra = require("hydra")

local function cmd(command)
   return table.concat({ "<cmd>", command, "<CR>" })
end

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
    { "B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Conditional breakpoint" } },
    { "L", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
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
 _t_: todos       _/_: search in file

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
      { "t", cmd "TodoTelescope" },
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
         if vim.bo.filetype ~= "dashboard" then
           vim.cmd.mkview()
           vim.cmd "silent! %foldopen!"
           vim.bo.modifiable = false
           require("gitsigns").toggle_linehl(true)
         end
      end,
      on_exit = function()
         if vim.bo.filetype ~= "dashboard" then
           local cursor_pos = vim.api.nvim_win_get_cursor(0)
           vim.cmd.loadview()
           vim.api.nvim_win_set_cursor(0, cursor_pos)
           vim.cmd.normal("zv")
           require("gitsigns").toggle_linehl(false)
           require("gitsigns").toggle_deleted(false)
         end
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
      { "c", cmd "Neogit commit", { exit = true, desc = "Commit" } },
      { "g", cmd "Neogit", { exit = true } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
   }
})


hydra({
  name = "Spellcheck",
  config = {
    type = "statusline",
    foreign_keys = "run",
    invoke_on_body = true,
  },
  mode = "n",
  body = "<localleader>s",
  heads = {
    { "n", cmd "lua require'spellsitter'.nav()" },
    { "N", cmd "lua require'spellsitter'.nav(true)", { desc = "Navigate" } },
    { "s", "z=", { desc = "Suggestions" } },
    { "ad", "zg", { desc = "Add to dictionary" } },
    { "<Esc>", nil, { exit = true, nowait = true } },
    { "q", nil, { exit = true, nowait = true, desc = "exit" } },
  }
})


