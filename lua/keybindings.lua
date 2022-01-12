local opts = { noremap = true }
local silentOpts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

local HARDMODE = false
if HARDMODE then
	-- Disable Arrow keys in Normal mode
	map("n", "<up>", "<nop>", silentOpts)
	map("n", "<down>", "<nop>", silentOpts)
	map("n", "<left>", "<nop>", silentOpts)
	map("n", "<right>", "<nop>", silentOpts)
	-- Disable hjkl in Normal mode
	map("n", "h", "<nop>", silentOpts)
	map("n", "j", "<nop>", silentOpts)
	map("n", "k", "<nop>", silentOpts)
	map("n", "l", "<nop>", silentOpts)
	-- Disable Arrow keys in Insert mode
	map("i", "<up>", "<nop>", silentOpts)
	map("i", "<down>", "<nop>", silentOpts)
	map("i", "<left>", "<nop>", silentOpts)
	map("i", "<right>", "<nop>", silentOpts)
end

-- Center to focus
map("n", "{", "{zz", silentOpts)
map("n", "}", "}zz", silentOpts)
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
map("v", "H", "<gv", silentOpts)
map("v", "J", ":m '>+1<cr>gv=gv", silentOpts)
map("v", "K", ":m '<-2<cr>gv=gv", silentOpts)
map("v", "L", ">gv", silentOpts)

-- Clipboard
map("n", "<leader>y", '"+y', silentOpts)
map("n", "<leader>Y", '"+Y', silentOpts)
map("v", "<leader>y", '"+y', silentOpts)
map("n", "<leader>d", '"+d', silentOpts)
map("n", "<leader>D", '"+D', silentOpts)
map("v", "<leader>d", '"+d', silentOpts)
map("n", "<leader>p", '"+p', silentOpts)
map("n", "<leader>P", '"+P', silentOpts)
map("v", "<leader>p", '"+p', silentOpts)
map("v", "p", '"_dP', silentOpts)

-- set spellcheck
--map('n', '<leader>l', ':setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

--LSP
map("n", "<leader>lI", ":LspInfo<cr>", silentOpts)
map("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", silentOpts)
map("n", "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", silentOpts)
map("n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", silentOpts)
map("n", "<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", silentOpts)
map("n", "<leader>ll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", silentOpts)
map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", silentOpts)
map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", silentOpts)
map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", silentOpts)
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", silentOpts)
map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", silentOpts)
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", silentOpts)
map("n", "<leader>le", "<cmd>lua vim.diagnostic.show_line_diagnostics()<cr>", silentOpts)
map("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", silentOpts)
map("n", "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev()<cr>", silentOpts)
--LSP-install
map("n", "<leader>li", ":LspInstallInfo<cr>", silentOpts)
--null-ls
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", silentOpts)
map("v", "<leader>ff", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", silentOpts)
map("n", "<leader>fi", ":NullLsInfo<cr>", silentOpts)

-- Open windows
map("n", "<leader>v", ":vsp .<cr>", silentOpts)
map("n", "<leader>h", ":sp .<cr>", silentOpts)
map("n", "<leader><cr>", ":vsp <bar> terminal<cr>", silentOpts)

-- replace in line
map("n", "<leader>s", ":s//gI<Left><Left><Left>", opts)
map("v", "<leader>s", ":s//gI<Left><Left><Left>", opts)
-- replace in file
map("n", "<leader>S", ":%s//gI<Left><Left><Left>", opts)
map("v", "<leader>S", ":%s//gI<Left><Left><Left>", opts)

--telescope
map("n", "<leader>t", ":Telescope find_files<cr>", silentOpts)

--Which key
map("n", "<leader>", ':WhichKey "<leader>"<cr>', silentOpts)
map("v", "<leader>", ':WhichKeyVisual "<leader>"<cr>', silentOpts)

--Git
map("n", "<leader>gs", ":G<cr>", silentOpts)
map("n", "<leader>gac", ":Git add %<cr>", silentOpts)
map("n", "<leader>gaa", ":Git add --all<cr>", silentOpts)
map("n", "<leader>gc", ":Git commit -m \"\"<Left>", opts)
map("n", "<leader>gg", ":Git add % <bar> Git commit -m \"\"<Left>", opts)
map("n", "<leader>gps", ":Git push<cr>", silentOpts)
map("n", "<leader>gpl", ":Git pull<cr>", silentOpts)
map("n", "<leader>gd", ":Git diff<cr>", silentOpts)
map("n", "<leader>gb", ":Git branch<cr>", silentOpts)
map("n", "<leader>gch", ":Git checkout ", opts)

-- misc
map("n", "<leader>e", ":Lex 30<cr>", opts)
map("n", '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
map("n", "U", "<C-R>", silentOpts)
