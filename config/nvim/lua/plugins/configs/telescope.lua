local telescope = require("telescope")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
       "rg",
       "--color=never",
       "--no-heading",
       "--with-filename",
       "--line-number",
       "--column",
       "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    file_ignore_patterns = {"node_modules", ".git", "%.o", "%.pdf", "%.class", "%.obj"},
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case"        -- or "ignore_case" or "respect_case"
    }
  }
}

-- Loading fzf extension
telescope.load_extension('fzf')
