local confDir = vim.fn.stdpath('config')..'/lua/'

local onWrite = vim.api.nvim_create_augroup("onFileWrite", { clear = true })
vim.api.nvim_create_autocmd( "BufWritePost", {
  pattern = "packer-init.lua",
  command = "source <afile> | PackerSync",
  group = onWrite
})
vim.api.nvim_create_autocmd( "BufWritePost", {
  pattern = "tmux.conf",
  command = "!tmux source-file ~/.config/tmux/tmux.conf; tmux display-message 'Reloaded tmux config'",
  group = onWrite
})

local onFileType vim.api.nvim_create_augroup("onFileType", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "tex", "text"},
  command = "setlocal textwidth=80",
  group = onFileType
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  group = onFileType,
  callback = function ()
    if vim.bo.filetype ~= "dashboard" then
      vim.cmd([[match TrailingSpace /\s\+$/]])
    end
  end
})

local lualineColors vim.api.nvim_create_augroup("lualineColors", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = "luafile "..confDir.."rnvim/lualine.lua",
  group = lualineColors
})
