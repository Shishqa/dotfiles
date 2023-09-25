local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local action_state = require "telescope.actions.state"


require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- local sorters = require("telescope.sorters")
local function files_wiki()
  builtin.find_files({
    prompt_title = "Wiki files",
    cwd = '/home/shishqa/docs/notes/notes',
    disable_devicons = true,
    find_command = { "rg", "--files", "--sort", "path" },
    file_ignore_patterns = {
      "%.stversions/",
      "%.git/",
      "%assets/",
    },
    path_display = function(_, path)
      local name = path:match "(.+)%.[^.]+$"
      return name or path
    end,
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace_if(function()
        return action_state.get_selected_entry() == nil
      end, function()
        actions.close(prompt_bufnr)

        local new_name = action_state.get_current_line()
        if new_name == nil or new_name == "" then
          return
        end

        vim.fn["wiki#page#open"](new_name)
      end)

      return true
    end,
  })
end

local function files()
  local dir = vim.fn.FindRootDirectory()
  if dir == "" then
    dir = vim.fn.getcwd()
  end
  builtin.find_files({
    prompt_title = "Find Files: " .. dir,
    cwd = dir,
  })
end

-- Mappings.
vim.keymap.set('n', '<leader><leader>', function() require('telescope.builtin').oldfiles() end)
vim.keymap.set('n', '<leader>ot', function() require('telescope.builtin').tags() end)
vim.keymap.set('n', '<leader>ob', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>og', function() require('telescope.builtin').git_files() end)
vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>ff', function() files() end)
vim.keymap.set('n', '<leader>fw', function() files_wiki() end)

--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
