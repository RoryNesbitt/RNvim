local map = vim.keymap.set

local function cmd(command)
  return table.concat({ '<cmd>', command, '<CR>' })
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

-- Center to focus
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
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
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { silent = true })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { silent = true })
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
map({ "n" }, "<leader>f", cmd "TZFocus", { desc = "Focus buffer" })
map({ "n" }, "<leader>z", cmd "TZAtaraxis", { desc = "Zen Mode" })

--Mason
map("n", "<leader>m", cmd "Mason", { desc = "Open Mason" })

--formatting
--null-ls
map("n", "<leader>nf", vim.lsp.buf.formatting_sync, { desc = "Format Buffer" })
map("v", "<leader>nf", vim.lsp.buf.range_formatting, { desc = "Format Buffer" })
map("n", "<leader>ni", cmd "NullLsInfo", { silent = true, desc = "Null-ls Info" })

-- Open windows
map("n", "<leader>v", cmd "vsp .", { silent = true, desc = "Vertical Split" })
map("n", "<leader>h", cmd "sp .", { silent = true, desc = "Horizontal Split" })
map("n", "<leader><cr>", cmd "vsp <bar> terminal", { silent = true, desc = "Neovim Terminal" })

-- replace in line
map({ "n", "v" }, "<leader>s", ":s///gI<Left><Left><Left><Left>", { desc = "Substitute Line" })
-- replace in file
map({ "n", "v" }, "<leader>S", ":%s///gI<Left><Left><Left><Left>", { desc = "Substitute File" })

--telescope
map("n", "<leader>j", cmd "Telescope find_files", { silent = true, desc = "Jump to file" })
map("n", "<leader>e", cmd "Telescope file_browser", { silent = true, desc = "File Browser" })
map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
    previewer = false,
  })
end, { desc = "Fuzzy Search" })
--Telescope-change-x
map("n", "<leader>cw", require("rnvim.telescope").change_wallpaper, { desc = "Change wallpaper" })
map("n", "<leader>cc", require("rnvim.telescope").change_colourscheme, { desc = "Change colourscheme" })

--whitespace
map("n", "<leader>w", cmd "%s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })
map("v", "<leader>w", cmd "s/\\s\\+$//", { silent = true, desc = "Remove trailing space" })

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i')
map("n", "U", "<C-R>")
map("n", "gh", function() require("rnvim").randomColours(true) end, { desc = "GAHH" })
map("n", "tc", require("rnvim").transparentBackground)
