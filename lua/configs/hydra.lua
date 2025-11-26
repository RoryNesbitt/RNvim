local hydra_ok, hydra = pcall(require, "hydra")
if not (
      hydra_ok
    ) then
  return
end

local function cmd(command)
  return table.concat { "<cmd>", command, "<CR>" }
end

local dap_ok, dap = pcall(require, "dap")
if dap_ok then
  local dap_hint = [[ _d_: continue _n_: step into _N_: step over _O_: step out _b_: breakpoint _B_: conditional breakpoint _L_: log point _r_: repl _q_/_<Esc>_: exit ]]
  hydra {
    name = "Debugging",
    config = {
      foreign_keys = "run",
      type = "statusline",
      invoke_on_body = true,
      hint = {
        position = "top",
      },
    },
    hint = dap_hint,
    mode = "n",
    body = "<leader>d",
    heads = {
      { "d", function() dap.continue() end, { desc = "Continue" } },
      { "n", function() dap.step_into() end, { desc = "Step into" } },
      { "N", function() dap.step_over() end, { desc = "Step over" } },
      { "O", function() dap.step_out() end, { desc = "Step out" } },
      { "b", function() dap.toggle_breakpoint() end, { desc = "Breakpoint" } },
      { "B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        { desc = "Conditional breakpoint" } },
      { "L", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Log point" } },
      { "r", function() dap.repl.open() end, { desc = "Repl" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
    }
  }
end

local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  local telescope_hint = [[
               Telescope

   _f_: filetypes   _b_: buffers
   _o_: old files   _g_: live grep
   _t_: todos       _/_: search in file

   _h_: vim help    _c_: execute command
   _k_: keymaps     _;_: commands history 
   _p_: plugins     _?_: search history

   _<Enter>_: Telescope           _<Esc>_/_q_
  ]]

  hydra {
    name = "Telescope",
    hint = telescope_hint,
    config = {
      color = "teal",
      invoke_on_body = true,
      hint = {
        position = "middle",
        float_opts = {
          border = "rounded",
        },
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
      { "p", cmd "Telescope lazy" },
      { "/", function()
        telescope.builtin.current_buffer_fuzzy_find {
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
          previewer = false,
        }
      end, { desc = "search in file" } },
      { "t", cmd "TodoTelescope" },
      { "b", cmd "Telescope buffers" },
      { "?", cmd "Telescope search_history", { desc = "search history" } },
      { ";", cmd "Telescope command_history", { desc = "command-line history" } },
      { "c", cmd "Telescope commands", { desc = "execute command" } },
      { "<Enter>", cmd "Telescope", { exit = true, desc = "list all pickers" } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
    }
  }
end

local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
  local gitsigns_hint = [[
   _]_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
   _[_: prev hunk   _S_: stage buffer      _p_: preview hunk   _B_: blame show full 
   _c_: commit
    
                    _<Enter>_/_g_: Neogit         _<Esc>_/_q_
  ]]

  hydra {
    name = "Git",
    hint = gitsigns_hint,
    config = {
      buffer = bufnr,
      color = "pink",
      invoke_on_body = true,
      hint = {
        float_opts = {
          border = "rounded",
        },
      },
      on_enter = function()
        if vim.bo.filetype ~= "dashboard" and vim.bo.filetype ~= "netrw" then
          vim.cmd.mkview()
          vim.cmd "silent! %foldopen!"
          vim.bo.modifiable = false
          gitsigns.toggle_linehl(true)
        end
      end,
      on_exit = function()
        if vim.bo.filetype ~= "dashboard" and vim.bo.filetype ~= "netrw" then
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          vim.cmd.loadview()
          vim.api.nvim_win_set_cursor(0, cursor_pos)
          vim.cmd.normal("zv")
          gitsigns.toggle_linehl(false)
          gitsigns.toggle_deleted(false)
        end
      end,
    },
    mode = { "n", "x" },
    body = "<leader>g",
    heads = {
      { "]",
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gitsigns.nav_hunk("next") end)
          return "<Ignore>"
        end,
        { expr = true, nowait = true, desc = "next hunk" } },
      { "[",
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gitsigns.nav_hunk("prev") end)
          return "<Ignore>"
        end,
        { expr = true, nowait = true, desc = "prev hunk" } },
      { "s",gitsigns.stage_hunk, { silent = true, desc = "stage hunk" } },
      { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
      { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
      { "d", gitsigns.preview_hunk_inline, { nowait = true, desc = "toggle deleted" } },
      { "b", gitsigns.blame_line, { desc = "blame" } },
      { "B", function() gitsigns.blame_line { full = true } end, { desc = "blame show full" } },
      { "<Enter>", cmd "Neogit", { exit = true, desc = "Neogit" } },
      { "c", cmd "Neogit commit", { exit = true, desc = "Commit" } },
      { "g", cmd "Neogit", { exit = true } },
      { "q", nil, { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil, { exit = true, nowait = true } },
    }
  }
end

local spell_hint = [[_f_: fix word     _s_: suggestions       _ra_: repeat for all instances
_<Esc>_/_q_    _ag_: add as good word   _ab_: add as bad word     _u_ _[_/_]_/_b_]]

hydra {
  name = "Spellcheck",
  hint = spell_hint,
  config = {
    foreign_keys = "run",
    invoke_on_body = true,
    hint = {
      float_opts = {
        border = "rounded",
      },
    },
  },
  mode = "n",
  body = "<localleader>s",
  heads = {
    { "]", "]s" },
    { "[", "[s", { desc = "Navigate" } },
    { "b", "[s", { desc = "Back" } },
    { "s", "z=", { exit = true, desc = "Suggestions" } },
    { "f", "1z=", { desc = "Fix word Automatically" } },
    { "ra", cmd "spellrepall", { desc = "Repeat fix for all instances" } },
    { "ag", "zg", { desc = "Add as good" } },
    { "ab", "zg", { desc = "Add as bad" } },
    { "u", "u" },
    { "<Esc>", nil, { exit = true, nowait = true } },
    { "q", nil, { exit = true, nowait = true, desc = "exit" } },
  }
}
