local map = vim.keymap.set

local function cmd(command)
  return table.concat { "<cmd>", command, "<CR>" }
end

local HARDMODE = 2
if HARDMODE > 0 then
  -- Disable Arrow keys in Normal mode
  map("n", "<up>", "<nop>")
  map("n", "<down>", "<nop>")
  map("n", "<left>", "<nop>")
  map("n", "<right>", "<nop>")
end
if HARDMODE > 1 then
  -- Disable Arrow keys in Insert mode
  map("i", "<up>", "<nop>")
  map("i", "<down>", "<nop>")
  map("i", "<left>", "<nop>")
  map("i", "<right>", "<nop>")
end
if HARDMODE > 2 then
  -- Disable hjkl in Normal mode
  map("n", "h", "<nop>")
  map("n", "j", "<nop>")
  map("n", "k", "<nop>")
  map("n", "l", "<nop>")
end

-- Better mouse mode
map({"n","x","i"}, "<RightMouse>", "<nop>")
map({"n","x","i"}, "<2-RightMouse>", "<nop>")
map({"n","x"}, "<ScrollWheelLeft>", "h")
map({"n","x"}, "<ScrollWheelDown>", "j")
map({"n","x"}, "<ScrollWheelUp>", "k")
map({"n","x"}, "<ScrollWheelRight>", "l")
map({"n","x"}, "<S-ScrollWheelDown>", cmd "keepj norm! }")
map({"n","x"}, "<S-ScrollWheelUp>", cmd "keepj norm! {")
map("i", "<ScrollWheelLeft>", "<left>")
map("i", "<ScrollWheelRight>", "<right>")
map("i", "<ScrollWheelUp>", "<up>")
map("i", "<ScrollWheelDown>", "<down>")

-- Center to focus
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "G", "Gzz")
map("n", "i", "zzi")
map("n", "I", "zzI")
map("n", "o", "zzo")
map("n", "O", "zzO")
map("n", "a", "zza")
map("n", "A", "zzA")
map("n", "s", "zzs")
map("n", "S", "zzS")
map("n", "c", "zzc")
map("n", "C", "zzC")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move line
map("x", "<", "<gv")
map("x", "J", ":m '>+1<cr>gv=gv", { silent = true })
map("x", "K", ":m '<-2<cr>gv=gv", { silent = true })
map("x", ">", ">gv")
-- Move Windows
map("n", "<C-S-h>", "<C-W>H")
map("n", "<C-S-j>", "<C-w>J")
map("n", "<C-S-k>", "<C-w>K")
map("n", "<C-S-l>", "<C-w>L")

-- Clipboard
map({ "n", "x" }, "<localleader>y", '"+y', { desc = "Yank to Clipboard" })
map({ "n", "x" }, "<localleader>d", '"+d', { desc = "Delete to Clipboard" })
map({ "n", "x" }, "<localleader>p", '"+p', { desc = "Paste from Clipboard" })
map("n", "<localleader>Y", '"+y$', { desc = "YANK to Clipboard" })
map("n", "<localleader>D", '"+D', { desc = "DELETE to Clipboard" })
map("n", "<localleader>P", '"+P', { desc = "PASTE from Clipboard" })
map("x", "p", '"_dP')

--Zen
map("n", "<leader>f", cmd "TZFocus", { desc = "Focus buffer" })
map("n", "<leader>z", cmd "TZAtaraxis", { desc = "Zen Mode" })

--Mason
map("n", "<leader>m", cmd "Mason", { desc = "Open Mason" })

--formatting
--LSP
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>li", cmd "LspInfo", { silent = true, desc = "LSP Info" })
-- map("n", "gd", vim.lsp.buf.definition, {buffer = 0}) -- This seems to already exist somewhere
map("n", "gd", "gdzz", { remap = true, desc = "Go to Definition" }) -- Add zz after regular gd command
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>ll", cmd "Telescope diagnostics", { silent = true, desc = "Show Diagnostics" })
map("n", "<leader>lr", cmd "Telescope lsp_references",
  { silent = true, desc = "Show References" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename Object" })
--null-ls
map({ "n", "x" }, "<leader>nf", function() vim.lsp.buf.format(); vim.cmd.retab() end, { desc = "Format Buffer" })
map("n", "<leader>ni", cmd "NullLsInfo", { silent = true, desc = "Null-ls Info" })

map("n", "]g", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end, { expr = true, nowait = true, desc = "Next git hunk" } )
map("n", "[g", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
          end, { expr = true, nowait = true, desc = "Previous git hunk" } )
-- Open windows
map("n", "<leader>v", cmd "vsp .", { silent = true, desc = "Vertical Split" })
map("n", "<leader>h", cmd "sp .", { silent = true, desc = "Horizontal Split" })
map("n", "<leader><cr>", cmd "vsp <bar> terminal", { silent = true, desc = "Neovim Terminal" })
map("n", "<leader>c", cmd "tabedit .", { silent = true, desc = "New tab" })
map("n", "<leader>e", cmd "edit .", { silent = true, desc = "File Browser" })

-- replace in line
map({ "n", "x" }, "<leader>s", [[:s/<C-r><C-w>//gI<Left><Left><Left>]], { desc = "Substitute Line" })
-- replace in file
map({ "n", "x" }, "<leader>S", [[:%s//gI<Left><Left><Left>]], { desc = "Substitute File" })

--telescope
map("n", "<leader>j", cmd "Telescope find_files", { silent = true, desc = "Jump to file" })
map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find {
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
    previewer = false,
  }
end, { desc = "Fuzzy Search" })
--Telescope-change-x
map("n", "<localleader>cw", function() require("configs.telescope").change_wallpaper() end, { desc = "Change wallpaper" })
map("n", "<localleader>cc", function() require("configs.telescope").change_colourscheme() end,
  { desc = "Change colourscheme" })

--whitespace
map("n", "<leader>w", cmd "%s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })
map("x", "<leader>w", cmd "s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i')
map("n", "U", "<C-R>")
map("n", "gh", function() require("rnvim").randomColours(true) end, { desc = "GAHH" })
map("n", "tb", function() require("rnvim").transparentBackground() end, { desc = "Transparent Background" })
map("n", "qZ", "Z")
