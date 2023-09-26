local ap_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
local cmp_ok, cmp = pcall(require, "cmp")
if not (
      ap_ok
      or cmp_ok
    ) then
  return
end

nvim_autopairs.setup {
  check_ts = true,
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done {
    map_char = {
      tex = "",
    },
  }
)
