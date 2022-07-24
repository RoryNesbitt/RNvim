require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local autoInstall = os.getenv("USER") ~= "root"
require("mason-lspconfig").setup {
    automatic_installation = autoInstall,
}
