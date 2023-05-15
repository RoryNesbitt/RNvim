local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup {
  disable_insert_on_commit = false,
  disable_commit_confirmation = true,
  commit_popup = {
    kind = "split",
  },
  kind = "tab", --This is redundant but I want to move it to floating when it's working

  integrations = {
    diffview = true,
  },
  sections = {
    recent = false,
  },

  mappings = {
    status = {
      [""] = "Close",
    },
  },
}
