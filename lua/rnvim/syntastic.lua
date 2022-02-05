--vim.wo.statusline = vim.wo.statusline .. '%#warningmsg#'
--vim.wo.statusline = vim.wo.statusline .. '%{SyntasticStatuslineFlag()}'
--vim.wo.statusline = vim.wo.statusline .. '%*'

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntaestic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 1

--Airline Syntastic
--vim.g.airline#extensions#syntastic#enabled = 1
--let airline#extensions#syntastic#error_symbol = 'E:'
--let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
--let airline#extensions#syntastic#warning_symbol = 'W:'
--let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'
