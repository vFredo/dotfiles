local gitsigns = require("gitsigns")

gitsigns.setup{
  signs = {
    add       = {text = '┃' },
    change    = {text = '┃' },
  },
  keymaps = {
    noremap = true,
    ['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
    ['n <Leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <Leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <Leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <Leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <Leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
    ['n <Leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <Leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <Leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <Leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    -- Text objects (i)nside (h)unk
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  signcolumn = true,
  word_diff = false,
  sign_priority = 100,
  status_formatter = nil, -- Use default
  preview_config = { border = 'rounded' },
  current_line_blame_opts = { delay = 200 },
  current_line_blame_formatter_opts = { relative_time = false },
}
