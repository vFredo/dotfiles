local ts = require("telescope")

ts.setup {
  defaults = {
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
    file_ignore_patterns = {"node_modules/*", ".git/*", "%.o", "%.pdf", "%.class", "%.obj"},
  }
}

local M = {}

-- Falling back to find_files if git_files can't find a .git directory
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
