local confDir = vim.fn.stdpath('config')..'/lua/'

local group = vim.api.nvim_create_augroup("RNvim", { clear = true })

vim.api.nvim_create_autocmd( "BufWritePost", {
  pattern = "packer-init.lua",
  command = "source <afile> | PackerSync",
  group = group
})

vim.api.nvim_create_autocmd( "BufWritePost", {
  pattern = "tmux.conf",
  command = "!tmux source-file ~/.config/tmux/tmux.conf; tmux display-message 'Reloaded tmux config'",
  group = group
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "tex", "text"},
  command = "setlocal textwidth=80",
  group = group
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function ()
    if vim.bo.filetype == "dashboard" then
      vim.cmd([[ highlight TrailingSpace gui=none ]])
    elseif vim.bo.filetype ~= "TelescopePrompt" and vim.bo.filetype ~= "TelescopeResults" then
      vim.cmd([[ highlight TrailingSpace gui=undercurl ]])
    end
  end,
  group = group,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = "luafile "..confDir.."rnvim/lualine.lua",
  group = group
})
