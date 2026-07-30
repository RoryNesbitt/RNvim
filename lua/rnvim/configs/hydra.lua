local hydra_ok, hydra = pcall(require, "hydra")
if not hydra_ok then return end

local function cmd(command)
  return table.concat { "<cmd>", command, "<CR>" }
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
      { "o", cmd "Telescope oldfiles",  { desc = "recently opened files" } },
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
      { "t",       cmd "TodoTelescope" },
      { "b",       cmd "Telescope buffers" },
      { "?",       cmd "Telescope search_history",  { desc = "search history" } },
      { ";",       cmd "Telescope command_history", { desc = "command-line history" } },
      { "c",       cmd "Telescope commands",        { desc = "execute command" } },
      { "<Enter>", cmd "Telescope",                 { exit = true, desc = "list all pickers" } },
      { "q",       nil,                             { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>",   nil,                             { exit = true, nowait = true } },
    }
  }
end

local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
  local gitsigns_hint = [[
   _]_: next hunk   _s_: stage hunk        _d_: show deleted
   _[_: prev hunk   _S_: stage buffer      _p_: preview hunk
   _r_: reset hunk  _b_: blame line        _B_: blame line (full)
   _g_: open neogit _c_: commit changes               _<Esc>_/_q_
  ]]

  hydra {
    name = "Git",
    hint = gitsigns_hint,
    config = {
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
          gitsigns.toggle_linehl(true)
          gitsigns.toggle_numhl(true)
          gitsigns.toggle_word_diff(true)
        end
      end,
      on_exit = function()
        if vim.bo.filetype ~= "dashboard" and vim.bo.filetype ~= "netrw" then
          vim.cmd.normal("zv")
          gitsigns.toggle_linehl(false)
          gitsigns.toggle_numhl(false)
          gitsigns.toggle_word_diff(false)
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
      { "g",     cmd "Neogit",                                       { exit = true, silent = true, desc = "neogit" } },
      { "c",     cmd "Neogit commit",                                { exit = true, silent = true, nowait = true, desc = "neogit commit" } },
      { "s",     gitsigns.stage_hunk,                                { silent = true, desc = "stage hunk" } },
      { "S",     gitsigns.stage_buffer,                              { desc = "stage buffer" } },
      { "p",     gitsigns.preview_hunk,                              { desc = "preview hunk" } },
      { "d",     gitsigns.preview_hunk_inline,                       { nowait = true, desc = "toggle deleted" } },
      { "b",     gitsigns.blame_line,                                { desc = "blame" } },
      { "B",     function() gitsigns.blame_line { full = true } end, { desc = "blame show full" } },
      { "r",     gitsigns.reset_hunk,                                { desc = "blame show full" } },
      { "q",     nil,                                                { exit = true, nowait = true, desc = "exit" } },
      { "<Esc>", nil,                                                { exit = true, nowait = true } },
    }
  }
end

local spell_hint = [[
_s_: suggestions
_f_: auto fix
_r_: repeat fix
_g_: add good
_w_: add bad
_G_: undo add good
_W_: undo add bad
_]_: next word
_[_: prev word
_<Esc>_/_q_
]]

hydra {
  name = "Spellcheck",
  hint = spell_hint,
  config = {
    color = "pink", -- stay active; foreign keys run without exiting
    invoke_on_body = true,
    hint = {
      position = "bottom-right",
      float_opts = {
        border = "rounded",
      },
    },
  },
  mode = "n",
  body = "<localleader>s",
  heads = {
    { "]",     "]s",              { desc = "next" } },
    { "[",     "[s",              { desc = "prev" } },
    { "f",     "1z=",             { desc = "accept first suggestion" } },
    { "s",     "z=",              { exit = true, desc = "suggestion list" } }, -- needs UI, so exit
    { "r",     cmd "spellrepall", { desc = "repeat last fix everywhere" } },
    { "g",     "zg",              { desc = "add good" } },
    { "w",     "zw",              { desc = "add bad" } },
    { "G",     "zug",             { desc = "undo add good" } },
    { "W",     "zuw",             { desc = "undo add bad" } },
    { "q",     nil,               { exit = true, nowait = true, desc = "exit" } },
    { "<Esc>", nil,               { exit = true, nowait = true } },
  },
}
