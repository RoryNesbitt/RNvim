local confDir = vim.fn.stdpath('config')..'/lua/'
vim.cmd([[
  augroup packer-updater
    autocmd!
    autocmd BufWritePost packer-init.lua source <afile> | PackerSync
  augroup end

  augroup tmux-reload
    autocmd!
    autocmd BufWritePost tmux.conf | !tmux source-file ~/.config/tmux/tmux.conf; tmux display-message "tmux.conf reloaded"
  augroup end

  augroup my_textwidth
    au!
    autocmd FileType text,markdown,tex setlocal textwidth=80
  augroup END

  augroup lualineColors
    autocmd!
    autocmd ColorScheme * luafile /home/rory/.config/nvim/lua/rnvim/lualine.lua
  augroup END
]])
