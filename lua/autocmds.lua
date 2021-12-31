vim.cmd([[
    augroup packer-updater
        autocmd!
        autocmd BufWritePost packer-init.lua source <afile> | PackerSync
    augroup end
]])

vim.cmd([[
    augroup tmux-reload
        autocmd!
        autocmd BufWritePost tmux.conf | !tmux source-file ~/.config/tmux/tmux.conf; tmux display-message "tmux.conf reloaded"
    augroup end
]])
