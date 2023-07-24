local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup {
  disable_commit_confirmation = true,
  use_telescope = true,
  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,
  kind = "tab",
  ignored_settings = {},
  commit_popup = {
    kind = "tab",
  },
  preview_buffer = {
    kind = "tab",
  },
  popup = {
    kind = "tab",
  },
  integrations = {
    diffview = true,
  },
  mappings = {
    finder = {
      ["<cr>"] = "select",
    }
  }
}
