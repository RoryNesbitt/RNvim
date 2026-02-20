local ts_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ts_ok then
  return
end

treesitter.setup {
  auto_install = true,
  ensure_installed = {
    "javascript",
    "typescript",
    "html",
    "css",
    "vim"
  },

}

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})


vim.treesitter.language.register('javascript', 'ejs')
vim.filetype.add({ extension = { ejs = "ejs" } })

local at_ok, autotag = pcall(require, "nvim-ts-autotag")
if at_ok then
  autotag.setup {}
end
