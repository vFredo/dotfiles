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
  keys = {
    { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "[f]ind [f]iles" },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "[f]ind [b]uffers" },
    { "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[f]ind [g]rep" },
    { "<Leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[f]ind [h]elp" },
    { "<Leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[f]ind [k]eymap" },
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      scroll_strategy = 'cycle',
      selection_strategy = "reset",
      layout_strategy = "horizontal",
      file_ignore_patterns = { "^.git/", "node_modules" },
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
      }
    },
    pickers = {
      find_files = { hidden = true },
      buffers = { ignore_current_buffer = true },
      live_grep = { addittional_args = '--hidden' }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
    }
  }
}
