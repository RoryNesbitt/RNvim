local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')
telescope.setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '﬌',
    selection_caret = " ",
    color_devicons = true,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extentions = {
    fzy_native = {
      overide_generic_sorter = false,
      overide_file_sorter = true,
    }
  }
}

if os.getenv('USER') ~= 'pi'
  then
    require('telescope').load_extension('fzy_native')
  end

  local M = {}
  M.search_dotfiles = function()
    require('telescope.builtin').find_files({
      prompt_title = '< init.vim >',
      cwd = '~/.config/nvim/',
    })
  end

  return M
