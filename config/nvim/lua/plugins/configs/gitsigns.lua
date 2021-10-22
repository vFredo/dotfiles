local gitsigns = require("gitsigns")

gitsigns.setup{
  keymaps = {
    noremap = false,
    ['n <Leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <Leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <Leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <Leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <Leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
    ['n <Leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <Leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <Leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <Leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <Leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
  },
  signcolumn = true,
  word_diff = false,
  sign_priority = 100,
  status_formatter = nil, -- Use default
  watch_gitdir = { interval = 100, follow_files = true },
}
