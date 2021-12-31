local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

nvim_autopairs.setup({
    check_ts = true,
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({
    map_char = {
        tex = ''
    }
}))
