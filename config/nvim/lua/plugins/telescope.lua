return {
  -- Fuzzy finder
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      cond = vim.fn.executable 'make' == 1,
      build = 'make',
      config = function()
        require("telescope").load_extension("fzf")
      end,
    }
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
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
      file_ignore_patterns = { "^.git/" }
    },
    pickers = {
      find_files = { hidden = true },
      buffers = { ignore_current_buffer = true },
      live_grep = { addittional_args = '--hidden' }
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case"        -- or "ignore_case" or "respect_case"
      }
    }
  }
}
