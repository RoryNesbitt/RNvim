local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	return
end

vim.g.dashboard_default_executive = "telescope"

local configDir = vim.fn.stdpath("config")
local dataDir = vim.fn.stdpath("data")
local dir = os.getenv("PVIM")
if dir then
  configDir = dir.."/config"
  dataDir = dir .."/clutter/lazy"
end

db.custom_center = {
	{ icon = "  ", desc = "Jump to File                ", action = "Telescope find_files" },
	{ icon = "  ", desc = "Recent Files                ", action = "Telescope oldfiles" },
	{ icon = "  ", desc = "Open Neogit                 ", action = require("neogit").open },
	{ icon = "  ", desc = "Search Text                 ", action = "Telescope live_grep" },
	{ icon = "  ", desc = "New File                    ", action = "DashboardNewFile" },
	{ icon = "  ", desc = "Edit Config                 ", action = function ()
    vim.cmd.cd(configDir)
    vim.cmd.Telescope("find_files")
  end},
	{ icon = "  ", desc = "Update Config               ", action = function ()
    print [[
===================================
          Pulling config
===================================

]]

    vim.fn.system("git --git-dir="..configDir.."/.git --work-tree="..configDir.." fetch")
    local changes = vim.fn.system("git --git-dir="..configDir.."/.git --work-tree="..configDir.." diff --name-only ..origin")
    print(vim.fn.system("git --git-dir="..configDir.."/.git --work-tree="..configDir.." pull"))
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
        require"lazy".sync()
      end)
    end
  end},
  --   
}

local function pluginCount()
	local i, popen = 0, io.popen
	for _ in popen("ls "..dataDir.."/lazy/"):lines() do
		i = i + 1
	end
	return i
end

db.custom_footer = { "Neovim loaded with " .. pluginCount() .. " plugins" }
--
local logos = {}
if dir then
  logos = require("rnvim.dashboard.pvim")
else
  logos = require("rnvim.dashboard.rnvim")
end

math.randomseed(os.clock()*100000000000)
local s = math.random(1,#logos)
db.custom_header = logos[s]
