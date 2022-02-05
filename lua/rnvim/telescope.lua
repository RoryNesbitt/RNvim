local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "﬌",
		selection_caret = " ",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
				["<C-h>"] = "which_key",
			},
		},
	},
	extentions = {
		fzy_native = {
			overide_generic_sorter = false,
			overide_file_sorter = true,
		},
	},
})

if os.getenv("USER") ~= "pi" then
	require("telescope").load_extension("fzy_native")
end

function set_background(content)
  vim.fn.system(
    "nitrogen --set-auto "..content
  )
end
local M = {}
M.change_wallpaper = function()
	require("telescope.builtin").find_files({
		prompt_title = "Wallpaper",
		cwd = "~/Pictures/Wallpapers",

    attach_mappings = function(prompt_bufnr, map)
      function set_the_background(close)
        local content =
          require('telescope.actions.state').get_selected_entry(bufnr)
        set_background(content.cwd.."/"..content.value)
        if close then
          require('telescope.actions').close(prompt_bufnr)
        end
      end

      map('i', '<C-s>', function(bufnr)
        set_the_background()
      end)
      map('n', 's', function(bufnr)
        set_the_background()
      end)

      map('i', '<CR>', function(bufnr)
        set_the_background(true)
      end)
      map('n', '<CR>', function(bufnr)
        set_the_background(true)
      end)

      return true
    end
	})
end

return M
