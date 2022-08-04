vim.g.firenvim_config = {
  globalSettings = {
    alt = 'all',
  },
  localSettings = {},
}

local fc = vim.g.firenvim_config['localSettings']
fc['.*'] = {
  cmdline = 'neovim',
  content = 'text',
  priority = 0,
  selector = 'textarea',
  takeover = 'never',
}

if vim.g.started_by_firenvim then
  vim.o.laststatus=0
  vim.wo.wrap=true
  vim.wo.linebreak=true
  vim.o.showbreak='~'
  vim.keymap.set("n", "j", "gj", {noremap = true})
  vim.keymap.set("n", "k", "gk", {noremap = true})

  local fireau = vim.api.nvim_create_augroup("start_by_fire", { clear = true })
  vim.api.nvim_create_autocmd("bufEnter", {
    pattern = "github.com_*.txt",
    command = "set filetype=markdown",
    group = fireau
  })

  vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
    pattern = "*",
    callback = function()
      if vim.bo.filetype ~= "TelescopePrompt"
         and vim.bo.filetype ~= "TelescopeResults"
         and vim.bo.filetype ~= "dashboard"
      then
        vim.cmd("write")
      end
    end,
    nested = true,
    group = fireau
  })

end
