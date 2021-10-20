local gitsigns = require("gitsigns")

gitsigns.setup{
  keymaps = { noremap = false },
  signcolumn = true,
  word_diff = false,
  sign_priority = 8,
  status_formatter = nil, -- Use default
  watch_gitdir = { interval = 100, follow_files = true },
}
