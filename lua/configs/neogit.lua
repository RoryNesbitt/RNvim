local neogit_ok, neogit = pcall(require, "neogit")
local telescope_ok, telescope = pcall(require, "telescope")
if not (
      neogit_ok
      or telescope_ok
    ) then
  return
end

neogit.setup {
  disable_commit_confirmation = true,
  use_telescope = true,
  telescope_sorter = function()
    return telescope.extensions.fzf.native_fzf_sorter()
  end,
  kind = "tab",
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
      ["<cr>"] = "Select",
    }
  }
}
