--VISUAL
vim.wo.cursorline = true -- Highlights the current line
--vim.wo.cursorcolumn = true        -- Highlights the current column
vim.g.mapleader = " "
vim.o.termguicolors = true
--vim.o.t_Co = '256'
--vim.bo.t_Co = '256'
vim.wo.wrap = false -- Long lines won't wrap
vim.wo.colorcolumn = "80" -- Adds a colour marker on the # column
vim.wo.signcolumn = "yes" -- Left side info column
vim.wo.scrolloff = 4 -- Keeps the cursor away from the top/bottom
vim.wo.sidescrolloff = 4 -- Keeps the cursor away from the sides
vim.o.cmdheight = 0 -- Hides the command line when not in use

--Tabs
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true

--Numbers
vim.wo.number = true
vim.wo.relativenumber = true

--Search
vim.o.hlsearch = false -- only highlight current selection
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- unless search includes upercase

--History
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.bo.undofile = true

--splitview
vim.o.splitbelow = true -- split down
vim.o.splitright = true -- vertical split right

--spellcheck
vim.opt.spell = true
vim.opt.spelllang = { 'en_gb' }

--Misc
vim.o.exrc = true -- Loads directory specific .vimrc files
vim.o.errorbells = false -- Silence
vim.o.showmatch = true -- Show matching brackets.
vim.o.showcmd = true -- Show (partial) command in status line.
vim.o.wildmode = "longest,list,full" -- Enable autocomplete files
