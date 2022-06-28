local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local autoInstall = os.getenv("USER") ~= "root"
lsp_installer.setup({
    automatic_installation = autoInstall,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
