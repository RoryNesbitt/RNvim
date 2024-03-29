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

    vim.cmd.source(findConfig() .. "/lua/configs/lualine.lua")
    if vim.g.started_by_firenvim then
      vim.opt.laststatus = 0
    end
  end,
  group = group
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "netrw",
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", function()
      if #vim.api.nvim_list_wins() > 1 then
        vim.api.nvim_win_close(0,1)
      else
        vim.cmd.quit()
      end
    end, { buffer = event.buf, silent = true })
  end,
  group = group
})

