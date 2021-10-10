local gitsigns = require("gitsigns")

gitsigns.setup{
  keymaps = { noremap = false },
  sign_priority = 5,
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
  },
  status_formatter = nil, -- Use default
  numhl = false,
}
