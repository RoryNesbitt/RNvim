--VISUAL
-- vim.opt.cursorline = true -- Highlights the current line
--vim.opt.cursorcolumn = true        -- Highlights the current column
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.termguicolors = true
--vim.opt.t_Co = "256"
vim.opt.wrap = false -- Long lines won't wrap
vim.opt.colorcolumn = "80" -- Adds a colour marker on the # column
vim.opt.signcolumn = "yes" -- Left side info column
vim.opt.scrolloff = 4 -- Keeps the cursor away from the top/bottom
vim.opt.sidescrolloff = 4 -- Keeps the cursor away from the sides
vim.opt.cmdheight = 0 -- Hides the command line when not in use
vim.opt.showtabline = 0 -- Hides the tabline
vim.opt.mouse = "" -- Disables mouse

--Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

--Numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Search
vim.opt.hlsearch = false -- only highlight current selection
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- unless search includes upercase

--History
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

--splitview
vim.opt.splitbelow = true -- split down
vim.opt.splitright = true -- vertical split right

--spellcheck
vim.opt.spell = true
vim.opt.spelllang = { "en_gb" }

--Misc
vim.opt.exrc = true -- Loads directory specific .vimrc files
vim.opt.errorbells = false -- Silence
vim.opt.showmatch = true -- Show matching brackets.
vim.opt.wildmode = "longest,list,full" -- Enable autocomplete files
vim.g.tex_flavor = 'latex'
