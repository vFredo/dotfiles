local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("Couldn't load gitsigns " .. gitsigns .. "/n")
end

gitsigns.setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    untracked = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },
  signcolumn = true,
  word_diff = false,
  status_formatter = nil, -- Use default
  preview_config = { border = 'rounded' },
  current_line_blame_opts = {
    delay = 200,
    virt_text_pos = "eol",
  },
  current_line_blame_formatter_opts = { relative_time = false },
  on_attach = function(bufnr)
    local map = require("core.utils").map
    local opts = { buffer = bufnr }
    local opts_expr = { buffer = bufnr, expr = true }
    local gs = package.loaded.gitsigns

    -- Navigation between hunks with ]h and [h
    map('n', ']h', function()
      if vim.wo.diff then return ']h' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, opts_expr)

    map('n', '[h', function()
      if vim.wo.diff then return '[h' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, opts_expr)

    -- Actions
    map({'n', 'v'}, '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', opts)
    map({'n', 'v'}, '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>', opts)
    map('n', '<leader>hS', gs.stage_buffer, opts)
    map('n', '<leader>hu', gs.undo_stage_hunk, opts)
    map('n', '<leader>hR', gs.reset_buffer, opts)
    map('n', '<leader>hb', gs.toggle_current_line_blame, opts)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<cr>', opts)
  end,
}
