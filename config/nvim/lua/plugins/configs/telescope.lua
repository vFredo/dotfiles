local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("Couldn't load telescope " .. telescope .. "\n")
end

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    scroll_strategy = 'cycle',
    selection_strategy = "reset",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      width = 0.90,
      height = 0.80,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.5)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
    },
    file_ignore_patterns = {
      "^node_modules/", "^.git/", "%.o",
      "%.pdf", "%.class", "%.obj"
    },
    mappings = {
      i = { ["<esc>"] = require('telescope.actions').close },
    },
  },
  pickers = {
    find_files = { hidden = true },
    buffers = { ignore_current_buffer = true },
    live_grep = { addittional_args = '--hidden' }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
    }
  }
})
telescope.load_extension('fzf') -- Loading fzf extension
