local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

vim.g.dashboard_default_executive = "telescope"

local configDir = vim.fn.stdpath("config")
local dataDir = vim.fn.stdpath("data")
local dir = os.getenv("PVIM")
if dir then
  configDir = dir .. "/config"
  dataDir = dir .. "/clutter/lazy"
end

local function pluginCount()
  local i, popen = 0, io.popen
  for _ in popen("ls " .. dataDir .. "/lazy/"):lines() do
    i = i + 1
  end
  return i
end

local logos = {}
if dir then
  logos = require("rnvim.dashboard.pvim")
else
  logos = require("rnvim.dashboard.rnvim")
end
math.randomseed(os.clock() * 100000000000)
local s = math.random(1, #logos)

db.setup {
  theme = 'doom',
  config = {
    header = logos[s],
    center = {
      { icon = '  ', desc = "Jump to File                      ",
        key = 'f',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = "Telescope find_files" },
      { icon = "  ", desc = "Open Neogit",
        key = 'g',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = require("neogit").open },
      { icon = "  ", desc = "Search Text",
        key = 't',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = "Telescope live_grep" },
      { icon = "  ", desc = "New File",
        key = 'n',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = "enew" },
      { icon = "  ", desc = "Edit Config",
        key = 'c',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = function()
          vim.cmd.cd(configDir)
          vim.cmd.Telescope("find_files")
        end },
      { icon = "  ", desc = "Update Config",
        key = 'u',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = function()
          print [[
===================================
          Pulling config
===================================

]]

          vim.fn.system("git --git-dir=" .. configDir .. "/.git --work-tree=" .. configDir .. " fetch")
          local changes = vim.fn.system("git --git-dir=" ..
            configDir .. "/.git --work-tree=" .. configDir .. " diff --name-only ..origin")
          print(vim.fn.system("git --git-dir=" .. configDir .. "/.git --work-tree=" .. configDir .. " pull"))
          if string.find(changes, "lua/rnvim/lazy/") then
            vim.ui.input({ prompt = [[
===================================
          Config updated
      Neovim needs to restart
===================================
]]
            }, function(input)
              if input == "c" or input == "C" then
              else
                vim.cmd.quitall()
              end
            end)
          else
            vim.ui.input({ prompt = [[
===================================
          Config updated
    Press enter to sync plugins
===================================
]]
            }, function(input)
              require "lazy".sync()
            end)
          end
        end },
      { icon = '󱎘  ', desc = "Quit",
        key = 'q',
        icon_hl = 'Title',
        desc_hl = 'String',
        key_hl = 'Number',
        action = "quit" },
      --   
    },
    footer = { "Neovim loaded with " .. pluginCount() .. " plugins" },
  }
}
