local gitsigns = require("gitsigns")

gitsigns.setup{
  keymaps = { noremap = false },
  signcolumn = true,
  sign_priority = 5,
  status_formatter = nil, -- Use default
  watch_gitdir = { interval = 100 },
}
