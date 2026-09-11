local ok, telescope = pcall(require, "telescope")
if not ok then return end

local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local state = require("telescope.actions.state")
telescope.setup {
  pickers = {
    find_files = {
      follow = true,
    },
  },
  defaults = {
    prompt_prefix = "> ",
    selection_caret = " ",
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-h>"] = "which_key",
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")

local function set_background(content)
  vim.fn.system(
    "nitrogen --set-scaled " .. content
  )
end

local M = {}
M.change_colourscheme = function()
  builtin.colorscheme {
    attach_mappings = function(prompt_, map)
      local cs = require("rnvim.colourscheme")
      local function set_colour(close)
        local content = state.get_selected_entry()
        cs.save(content.value)
        if close then
          actions.close(prompt_)
        end
      end

      map("i", "<C-s>", function()
        set_colour()
      end)
      map("n", "s", function()
        set_colour()
      end)

      map("i", "<CR>", function()
        set_colour(true)
      end)
      map("n", "<CR>", function()
        set_colour(true)
      end)

      map("i", "<C-t>", function()
        cs.clear()
      end)
      map("n", "t", function()
        cs.clear()
      end)
      return true
    end
  }
end

M.change_wallpaper = function()
  builtin.find_files {
    prompt_title = "Wallpaper",
    cwd = "~/Pictures/Wallpapers",
    previewer = false,

    attach_mappings = function(prompt_, map)
      local function set_the_background(close)
        local content =
            state.get_selected_entry()
        set_background(content.cwd .. "/" .. content.value)
        if close then
          actions.close(prompt_)
        end
      end

      map("i", "<C-s>", function()
        set_the_background()
      end)
      map("n", "s", function()
        set_the_background()
      end)

      map("i", "<CR>", function()
        set_the_background(true)
      end)
      map("n", "<CR>", function()
        set_the_background(true)
      end)

      return true
    end
  }
end

return M
