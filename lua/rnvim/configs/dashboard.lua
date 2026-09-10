local db_ok, db = pcall(require, "dashboard")
if not db_ok then
  return
end

local configDir = vim.fn.stdpath("config")
local dir = os.getenv("PVIM")
if dir then
  configDir = dir .. "/config"
end

-- Random logo
local logos
if dir then
  logos = require("rnvim.logos.pvim")
else
  logos = require("rnvim.logos.rnvim")
end
math.randomseed(os.clock() * 1e11)
local header = logos[math.random(1, #logos)]

local neogit_ok, neogit = pcall(require, "neogit")

local function pluginCount()
  local ok, plugins = pcall(vim.pack.get)
  if ok and type(plugins) == "table" then
    return #plugins
  end
end

db.setup {
  theme = "doom",
  config = {
    header = header,
    center = {
      {
        icon = "  ",
        desc = "Jump to File",
        key = "f",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        desc = "Open Neogit",
        key = "g",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = function()
          if neogit_ok then neogit.open() end
        end,
      },
      {
        icon = "  ",
        desc = "Search Text",
        key = "t",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = "Telescope live_grep",
      },
      {
        icon = "󰉋  ",
        desc = "Explore Files",
        key = "e",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = "Explore",
      },
      {
        icon = "  ",
        desc = "New File",
        key = "n",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = "enew",
      },
      {
        icon = "  ",
        desc = "Edit Config",
        key = "c",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = function()
          vim.cmd.cd(configDir)
          vim.cmd.Telescope("find_files")
        end,
      },
      {
        icon = "  ",
        desc = "Update Config",
        key = "u",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = function()
          vim.notify("Pulling config")
          vim.fn.system({ "git", "-C", configDir, "fetch" })
          local changes = vim.fn.system({ "git", "-C", configDir, "diff", "--name-only", "..origin" })
          local out = vim.fn.system({ "git", "-C", configDir, "pull" })
          vim.notify(out)
          if out:find("You have unstaged changes") then
            vim.cmd.cd(configDir)
            if neogit_ok then neogit.open() end
          elseif changes:find("plugins%.lua") then
            vim.notify("Plugin list changed — restart Neovim, then run :lua vim.pack.update()", vim.log.levels.WARN)
          else
            -- no lazy.sync(); optional pack update
            pcall(vim.pack.update)
          end
        end,
      },
      {
        icon = "󱎘  ",
        desc = "Quit",
        key = "q",
        icon_hl = "Title",
        desc_hl = "String",
        key_hl = "Number",
        action = "quit",
      },
    },
    footer = { "Neovim loaded with " .. pluginCount() .. " plugins" },
    vertical_center = true,
  },
}
