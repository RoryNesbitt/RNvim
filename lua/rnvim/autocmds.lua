local group = vim.api.nvim_create_augroup("RNvim", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "packer-init.lua",
  command = "source <afile> | PackerSync",
  group = group
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "tmux.conf",
  command = "!tmux source-file ~/.config/tmux/tmux.conf; tmux display-message 'Reloaded tmux config'",
  group = group
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  command = "setlocal textwidth=80",
  group = group
})

local ignoredTrails = { "TelescopeResults", "TelescopePrompt", "lazy", "mason" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "dashboard" then
      vim.cmd.highlight("TrailingSpace gui=none")
    elseif not vim.tbl_contains(ignoredTrails, vim.bo.filetype) then
      vim.cmd.highlight("TrailingSpace gui=undercurl")
    end
  end,
  group = group,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local function findConfig()
      local configDir = os.getenv("PVIM")
      if configDir then
        configDir = configDir .. "/config"
      else
        configDir = vim.fn.stdpath("config")
      end
      return configDir
    end

    vim.cmd.source(findConfig() .. "/lua/rnvim/lualine.lua")
    if vim.g.started_by_firenvim then
      vim.opt.laststatus = 0
    end
  end,
  group = group
})
