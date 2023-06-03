local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

nvim_autopairs.setup {
  check_ts = true,
}

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done {
    map_char = {
      tex = "",
    },
  }
)
