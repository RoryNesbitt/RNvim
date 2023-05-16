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
map({"n","v","i"}, "<RightMouse>", "<nop>")
map({"n","v","i"}, "<2-RightMouse>", "<nop>")
map({"n","v"}, "<ScrollWheelLeft>", "h")
map({"n","v"}, "<ScrollWheelDown>", "j")
map({"n","v"}, "<ScrollWheelUp>", "k")
map({"n","v"}, "<ScrollWheelRight>", "l")
map({"n","v"}, "<S-ScrollWheelDown>", cmd "keepj norm! }")
map({"n","v"}, "<S-ScrollWheelUp>", cmd "keepj norm! {")
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

-- Move line
map("v", "<", "<gv")
map("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
map("v", "K", ":m '<-2<cr>gv=gv", { silent = true })
map("v", ">", ">gv")
-- Move Windows
map("n", "<C-S-h>", "<C-W>H")
map("n", "<C-S-j>", "<C-w>J")
map("n", "<C-S-k>", "<C-w>K")
map("n", "<C-S-l>", "<C-w>L")

-- Clipboard
map({ "n", "v" }, "<localleader>y", '"+y', { desc = "Yank to Clipboard" })
map({ "n", "v" }, "<localleader>d", '"+d', { desc = "Delete to Clipboard" })
map({ "n", "v" }, "<localleader>p", '"+p', { desc = "Paste from Clipboard" })
map("n", "<localleader>Y", '"+y$', { desc = "YANK to Clipboard" })
map("n", "<localleader>D", '"+D', { desc = "DELETE to Clipboard" })
map("n", "<localleader>P", '"+P', { desc = "PASTE from Clipboard" })
map("v", "p", '"_dP')

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
map({ "n", "v" }, "<leader>nf", vim.lsp.buf.format, { desc = "Format Buffer" })
map("n", "<leader>ni", cmd "NullLsInfo", { silent = true, desc = "Null-ls Info" })

-- Open windows
map("n", "<leader>v", cmd "vsp .", { silent = true, desc = "Vertical Split" })
map("n", "<leader>h", cmd "sp .", { silent = true, desc = "Horizontal Split" })
map("n", "<leader><cr>", cmd "vsp <bar> terminal", { silent = true, desc = "Neovim Terminal" })
map("n", "<leader>c", cmd "tabedit .", { silent = true, desc = "New tab" })
map("n", "<leader>e", cmd "edit .", { silent = true, desc = "File Browser" })

-- replace in line
map({ "n", "v" }, "<leader>s", [[:s/<C-r><C-w>//gI<Left><Left><Left>]], { desc = "Substitute Line" })
-- replace in file
map({ "n", "v" }, "<leader>S", [[:%s//gI<Left><Left><Left>]], { desc = "Substitute File" })

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
map("n", "<localleader>cw", function() require("rnvim.telescope").change_wallpaper() end, { desc = "Change wallpaper" })
map("n", "<localleader>cc", function() require("rnvim.telescope").change_colourscheme() end,
  { desc = "Change colourscheme" })

--whitespace
map("n", "<leader>w", cmd "%s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })
map("v", "<leader>w", cmd "s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i')
map("n", "U", "<C-R>")
map("n", "gh", function() require("rnvim").randomColours(true) end, { desc = "GAHH" })
map("n", "tb", function() require("rnvim").transparentBackground() end, { desc = "Transparent Background" })
map("n", "qZ", "Z")
