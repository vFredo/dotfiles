local gitsigns = require("gitsigns")

gitsigns.setup{
  signs = {
    add       = {text = '┃' },
    change    = {text = '┃' },
  },
  keymaps = {
    noremap = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
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
