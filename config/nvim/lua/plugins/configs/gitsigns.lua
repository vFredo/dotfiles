local gitsigns = require("gitsigns")

gitsigns.setup{
  keymaps = { noremap = false },
  sign_priority = 5,
  status_formatter = nil, -- Use default
  numhl = false,
}
