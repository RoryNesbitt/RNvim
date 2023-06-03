return {
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    config = function ()
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup()
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      }
    },
  },
}
