local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) and not os.getenv("PVIM") then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup{
   spec = {
     { import = "plugins"},
   },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false },
}
