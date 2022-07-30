local opts = { noremap = true }
local silentOpts = { noremap = true, silent = true }
local map = vim.keymap.set

local function cmd(command)
   return table.concat({ '<cmd>', command, '<CR>' })
end

local HARDMODE = 2
if HARDMODE > 0 then
  -- Disable Arrow keys in Normal mode
  map("n", "<up>", "<nop>", silentOpts)
  map("n", "<down>", "<nop>", silentOpts)
  map("n", "<left>", "<nop>", silentOpts)
  map("n", "<right>", "<nop>", silentOpts)
end
if HARDMODE > 1 then
  -- Disable Arrow keys in Insert mode
  map("i", "<up>", "<nop>", silentOpts)
  map("i", "<down>", "<nop>", silentOpts)
  map("i", "<left>", "<nop>", silentOpts)
  map("i", "<right>", "<nop>", silentOpts)
end
if HARDMODE > 2 then
  -- Disable hjkl in Normal mode
  map("n", "h", "<nop>", silentOpts)
  map("n", "j", "<nop>", silentOpts)
  map("n", "k", "<nop>", silentOpts)
  map("n", "l", "<nop>", silentOpts)
end

-- Center to focus
map("n", "{", "{zz", silentOpts)
map("n", "}", "}zz", silentOpts)
map("n", "n", "nzz", silentOpts)
map("n", "N", "Nzz", silentOpts)
map("n", "i", "zzi", silentOpts)
map("n", "I", "zzI", silentOpts)
map("n", "o", "zzo", silentOpts)
map("n", "O", "zzO", silentOpts)
map("n", "a", "zza", silentOpts)
map("n", "A", "zzA", silentOpts)
map("n", "s", "zzs", silentOpts)
map("n", "S", "zzS", silentOpts)
map("n", "c", "zzc", silentOpts)
map("n", "C", "zzC", silentOpts)

-- Move line
map("v", "<", "<gv", silentOpts)
map("v", "<S-j>", ":m '>+1<cr>gv=gv", silentOpts)
map("v", "<S-k>", ":m '<-2<cr>gv=gv", silentOpts)
map("v", ">", ">gv", silentOpts)
-- Move Windows
map("n", "<C-S-h>", "<C-W>H", silentOpts)
map("n", "<C-S-j>", "<C-w>J", silentOpts)
map("n", "<C-S-k>", "<C-w>K", silentOpts)
map("n", "<C-S-l>", "<C-w>L", silentOpts)

-- Clipboard
map({ "n", "v" }, "<localleader>y", '"+y', silentOpts)
map("n", "<localleader>Y", '"+Y', silentOpts)
map({ "n", "v" }, "<localleader>d", '"+d', silentOpts)
map("n", "<localleader>D", '"+D', silentOpts)
map({ "n", "v" }, "<localleader>p", '"+p', silentOpts)
map("n", "<localleader>P", '"+P', silentOpts)
map("v", "p", '"_dP', silentOpts)

--Zen
map({"n"}, "<leader>f", cmd "TZFocus", silentOpts)
map({"n"}, "<leader>z", cmd "TZAtaraxis", silentOpts)

--Mason
map("n", "<leader>m", cmd "Mason", silentOpts)

--formatting
--null-ls
map("n", "<leader>nf", function() vim.lsp.buf.formatting_sync() end, silentOpts)
map("v", "<leader>nf", function() vim.lsp.buf.range_formatting() end, silentOpts)
map("n", "<leader>ni", cmd "NullLsInfo", silentOpts)

-- Open windows
map("n", "<leader>v", cmd "vsp .", silentOpts)
map("n", "<leader>h", cmd "sp .", silentOpts)
map("n", "<leader><cr>", cmd "vsp <bar> terminal", silentOpts)

-- replace in line
map({ "n", "v" }, "<leader>s", ":s//gI<Left><Left><Left>", opts)
-- replace in file
map({ "n", "v" }, "<leader>S", ":%s//gI<Left><Left><Left>", opts)

--telescope
map("n", "<leader>j", cmd "Telescope find_files", silentOpts)
map("n", "<leader>e", cmd "Telescope file_browser", silentOpts)
--Telescope-change-x
map("n", "<leader>cw", function() require("rnvim.telescope").change_wallpaper() end, silentOpts)
map("n", "<leader>cc", function() require("rnvim.telescope").change_colourscheme() end, silentOpts)

--whitespace
map("n", "<leader>w", cmd "%s/\\s\\+$//", silentOpts)
map("v", "<leader>w", cmd "s/\\s\\+$//", silentOpts)

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
map("n", "U", "<C-R>", silentOpts)
map("n", "gh", function() require("rnvim").randomColours(true) end, silentOpts)
map("n", "tc", function() require("rnvim").transparentBackground() end, silentOpts)
