local opts = { noremap = true }
local silentOpts = { noremap = true, silent = true }
local map = vim.keymap.set

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
map("v", "<S-h>", "<gv", silentOpts)
map("v", "<S-j>", ":m '>+1<cr>gv=gv", silentOpts)
map("v", "<S-k>", ":m '<-2<cr>gv=gv", silentOpts)
map("v", "<S-l>", ">gv", silentOpts)
-- Move Windows
map("n", "<C-S-h>", "<C-W>H", silentOpts)
map("n", "<C-S-j>", "<C-w>J", silentOpts)
map("n", "<C-S-k>", "<C-w>K", silentOpts)
map("n", "<C-S-l>", "<C-w>L", silentOpts)

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', silentOpts)
map("n", "<leader>Y", '"+Y', silentOpts)
map({ "n", "v" }, "<leader>d", '"+d', silentOpts)
map("n", "<leader>D", '"+D', silentOpts)
map({ "n", "v" }, "<leader>p", '"+p', silentOpts)
map("n", "<leader>P", '"+P', silentOpts)
map("v", "p", '"_dP', silentOpts)

-- set spellcheck
--map('n', '<leader>l', '<cmd>setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

--LSP
map("n", "<leader>li", "<cmd>LspInfo<cr>", silentOpts)
map("n", "<leader>lk", function()
	vim.lsp.buf.signature_help()
end, silentOpts)
map("n", "<leader>lK", function()
	vim.lsp.buf.hover()
end, silentOpts)
map("n", "<leader>lwa", function()
	vim.lsp.buf.add_workspace_folder()
end, silentOpts)
map("n", "<leader>lwr", function()
	vim.lsp.buf.remove_workspace_folder()
end, silentOpts)
map("n", "<leader>lwi", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, silentOpts)
map("n", "<leader>lt", function()
	vim.lsp.buf.type_definition()
end, silentOpts)
map("n", "<leader>ld", function()
	vim.lsp.buf.definition()
end, silentOpts)
map("n", "<leader>lD", function()
	vim.lsp.buf.declaration()
end, silentOpts)
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", silentOpts)
map("n", "<leader>lR", function()
	vim.lsp.buf.rename()
end, silentOpts)
map("n", "<leader>la", "<cmd>Telescope lsp_code_actions<cr>", silentOpts)
map("n", "<leader>ll", "<cmd>Telescope diagnostics<cr>", silentOpts)
map("n", "<leader>ln", function()
	vim.diagnostic.goto_next()
end, silentOpts)
map("n", "<leader>lp", function()
	vim.diagnostic.goto_prev()
end, silentOpts)
--LSP-install
map("n", "<leader>lI", "<cmd>Mason<cr>", silentOpts)
--null-ls
map("n", "<leader>ff", function()
	vim.lsp.buf.formatting_sync()
end, silentOpts)
map("v", "<leader>ff", function()
	vim.lsp.buf.range_formatting()
end, silentOpts)
map("n", "<leader>fi", "<cmd>NullLsInfo<cr>", silentOpts)

-- Open windows
map("n", "<leader>v", "<cmd>vsp .<cr>", silentOpts)
map("n", "<leader>h", "<cmd>sp .<cr>", silentOpts)
map("n", "<leader><cr>", "<cmd>vsp <bar> terminal<cr>", silentOpts)

-- replace in line
map({ "n", "v" }, "<leader>s", ":s//gI<Left><Left><Left>", opts)
-- replace in file
map({ "n", "v" }, "<leader>S", ":%s//gI<Left><Left><Left>", opts)

--telescope
map("n", "<leader>j", "<cmd>Telescope find_files<cr>", silentOpts)
map("n", "<leader>tg", "<cmd>Telescope grep_string<cr>", silentOpts)
map("n", "<leader>e", "<cmd>Telescope file_browser<cr>", silentOpts)
map("n", "<leader>tf", "<cmd>Telescope filetypes<cr>", silentOpts)
map("n", "<leader>te", "<cmd>Telescope builtin<cr>", silentOpts)
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", silentOpts)
map("n", "<leader>th", "<cmd>Telescope help_tags<cr>", silentOpts)
map("n", "<leader>tc", "<cmd>Telescope commands<cr>", silentOpts)
map("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
		previewer = false,
	})
end, silentOpts)
--Telescope-change-x
map("n", "<leader>cw", function()
	require("rnvim.telescope").change_wallpaper()
end, silentOpts)
map("n", "<leader>cc", function()
	require("rnvim.telescope").change_colourscheme()
end, silentOpts)

--Git
map("n", "<leader>gg", function()
	require("neogit").open()
end, silentOpts)
map("n", "<leader>ga", "<cmd>Git add %<cr>", silentOpts)
map("n", "<leader>gc", function()
	require("neogit").open({ "commit" })
end, silentOpts)
map("n", "<leader>gp", "<cmd>Git pull<cr>", silentOpts)
map("n", "<leader>gP", "<cmd>Git push<cr>", silentOpts)
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", silentOpts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", silentOpts)

--whitespace
map("n", "<leader>w", "<cmd>%s/\\s\\+$//<cr>", silentOpts)
map("v", "<leader>w", "<cmd>s/\\s\\+$//<cr>", silentOpts)

-- misc
map("n", '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
map("n", "U", "<C-R>", silentOpts)
map("n", "gh", function()
	require("rnvim").randomColours(true)
end, silentOpts)
map("n", "tc", function()
	require("rnvim").transparentBackground()
end, silentOpts)
