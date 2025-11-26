local diffview_ok, diffview = pcall(require, "diffview")
local config_ok, config = pcall(require, "diffview.config")
if not (
      diffview_ok
      or config_ok
    ) then
  return
end

diffview.setup {
  enhanced_diff_hl = true,
  icons = { -- TODO: Change these
    folder_closed = "",
    folder_open = "",
  },
  file_panel = {
    win_config = {
      width = 25,
    }
  },
}
