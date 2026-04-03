local mason_ok, mason = pcall(require, "mason")
if mason_ok then
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

require("mason-lspconfig").setup({
  ensure_installed = {
    "efm",
  },
})
