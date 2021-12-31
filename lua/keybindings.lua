local opts = {noremap = true}
local silentOpts = {noremap = true, silent = true}

-- LET HARDMODE=0
if HARDMODE then
    -- Disable Arrow keys in Normal mode
    vim.api.nvim_set_keymap('n', '<up>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<down>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<left>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', '<right>', '<nop>', silentOpts)
    -- Disable hjkl in Normal mode
    vim.api.nvim_set_keymap('n', 'h', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'j', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'k', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('n', 'l', '<nop>', silentOpts)
    -- Disable Arrow keys in Insert mode
    vim.api.nvim_set_keymap('i', '<up>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<down>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<left>', '<nop>', silentOpts)
    vim.api.nvim_set_keymap('i', '<right>', '<nop>', silentOpts)
end

-- Center to focus
vim.api.nvim_set_keymap('n', '{', '{zz', silentOpts)
vim.api.nvim_set_keymap('n', '}', '}zz', silentOpts)
vim.api.nvim_set_keymap('n', 'i', 'zzi', silentOpts)
vim.api.nvim_set_keymap('n', 'I', 'zzI', silentOpts)
vim.api.nvim_set_keymap('n', 'o', 'zzo', silentOpts)
vim.api.nvim_set_keymap('n', 'O', 'zzO', silentOpts)
vim.api.nvim_set_keymap('n', 'a', 'zza', silentOpts)
vim.api.nvim_set_keymap('n', 'A', 'zzA', silentOpts)
vim.api.nvim_set_keymap('n', 's', 'zzs', silentOpts)
vim.api.nvim_set_keymap('n', 'S', 'zzS', silentOpts)
vim.api.nvim_set_keymap('n', 'c', 'zzc', silentOpts)
vim.api.nvim_set_keymap('n', 'C', 'zzC', silentOpts)

-- Move line
vim.api.nvim_set_keymap('v', 'H', '<gv', silentOpts)
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<cr>gv=gv", silentOpts)
vim.api.nvim_set_keymap('v', 'L', '>gv', silentOpts)

-- Clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>Y', '"+Y', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>d', '"+d', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>D', '"+D', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', silentOpts)
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', silentOpts)
vim.api.nvim_set_keymap('v', 'p', '"_dP', silentOpts)

-- set spellcheck
--vim.api.nvim_set_keymap('n', '<leader>l', ':setlocal spell spell! spelllang=en_gb<CR>', silentOpts)

--LSP
vim.api.nvim_set_keymap('n', '<leader>li', ':LspInfo<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lw', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lW', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', silentOpts)

-- Open windows
vim.api.nvim_set_keymap('n', '<leader>v', ':vsp .<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader>h', ':sp .<cr>', silentOpts)
vim.api.nvim_set_keymap('n', '<leader><cr>', ':vsp <bar> terminal<cr>', silentOpts)

-- replace in line
vim.api.nvim_set_keymap('n', '<leader>s', ':s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>s', ':s//gI<Left><Left><Left>', opts)
-- replace in file
vim.api.nvim_set_keymap('n', '<leader>S', ':%s//gI<Left><Left><Left>', opts)
vim.api.nvim_set_keymap('v', '<leader>S', ':%s//gI<Left><Left><Left>', opts)

-- misc
vim.api.nvim_set_keymap('n', '<leader>e', ':Lex 30<cr>', opts)
vim.api.nvim_set_keymap('n', '""', 'zto""""""<Escape><Left><Left>i', silentOpts)
vim.api.nvim_set_keymap('n', 'U', '<C-R>', silentOpts)
