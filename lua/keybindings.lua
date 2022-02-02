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
map("v", "J", "<cmd>m '>+1<cr>gv=gv", silentOpts)
map("v", "K", "<cmd>m '<-2<cr>gv=gv", silentOpts)
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
--map('n', '<leader>l', '<cmd>setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

--LSP
map("n", "<leader>lI", "<cmd>LspInfo<cr>", silentOpts)
map("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", silentOpts)
map("n", "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", silentOpts)
map("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", silentOpts)
map("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", silentOpts)
map("n", "<leader>lwi", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", silentOpts)
map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", silentOpts)
map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", silentOpts)
map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", silentOpts)
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", silentOpts)
map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", silentOpts)
--map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", silentOpts)
map("n", "<leader>la", "<cmd>Telescope lsp_code_actions<cr>", silentOpts)
--map("n", "<leader>ll", "<cmd>lua vim.diagnostic.show_line_diagnostics()<cr>", silentOpts)
map("n", "<leader>ll", "<cmd>Telescope diagnostics<cr>", silentOpts)
map("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", silentOpts)
map("n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", silentOpts)
--LSP-install
map("n", "<leader>li", "<cmd>LspInstallInfo<cr>", silentOpts)
--null-ls
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", silentOpts)
map("v", "<leader>ff", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", silentOpts)
map("n", "<leader>fi", "<cmd>NullLsInfo<cr>", silentOpts)

-- Open windows
map("n", "<leader>v", "<cmd>vsp .<cr>", silentOpts)
map("n", "<leader>h", "<cmd>sp .<cr>", silentOpts)
map("n", "<leader><cr>", "<cmd>vsp <bar> terminal<cr>", silentOpts)

-- replace in line
map("n", "<leader>s", "<cmd>s//gI<Left><Left><Left>", opts)
map("v", "<leader>s", "<cmd>s//gI<Left><Left><Left>", opts)
-- replace in file
map("n", "<leader>S", "<cmd>%s//gI<Left><Left><Left>", opts)
map("v", "<leader>S", "<cmd>%s//gI<Left><Left><Left>", opts)

--telescope
map("n", "<leader>j", "<cmd>Telescope find_files<cr>", silentOpts)
map("n", "<leader>tg", "<cmd>Telescope grep_string<cr>", silentOpts)
map("n", "<leader>e", "<cmd>Telescope file_browser<cr>", silentOpts)
map("n", "<leader>tf", "<cmd>Telescope filetypes<cr>", silentOpts)
map("n", "<leader>te", "<cmd>Telescope builtin<cr>", silentOpts)
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", silentOpts)
map("n", "<leader>th", "<cmd>Telescope help_tags<cr>", silentOpts)
map("n", "<leader>tc", "<cmd>Telescope commands<cr>", silentOpts)
map("n", "<leader>/",
  "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find({sorting_strategy='ascending', layout_config={prompt_position='top'}, previewer=false})<cr>",
  silentOpts)

--Git
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", silentOpts)
map("n", "<leader>gac", "<cmd>Git add %<cr>", silentOpts)
map("n", "<leader>gaa", "<cmd>Git add --all<cr>", silentOpts)
map("n", "<leader>gau", "<cmd>Git add --update<cr>", silentOpts)
map("n", "<leader>gc", "<cmd>Git commit -m \"\"<Left>", opts)
map("n", "<leader>gg", "<cmd>Git add --update <bar> Git commit -m \"\"<Left>", opts)
map("n", "<leader>gps", "<cmd>Git push<cr>", silentOpts)
map("n", "<leader>gpl", "<cmd>Git pull<cr>", silentOpts)
map("n", "<leader>gd", "<cmd>Git diff<cr>", silentOpts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", silentOpts)
map("n", "<leader>gch", "<cmd>Git checkout ", opts)

--whitespace
map("n", "<leader>w", "<cmd>%s/\\s\\+$//<cr>", silentOpts)
map("v", "<leader>w", "<cmd>s/\\s\\+$//<cr>", silentOpts)

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
map("n", "U", "<C-R>", silentOpts)
