return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<Leader>g", "<cmd>vert Git<cr>", desc = "[g]it view" }
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        untracked = { text = "▎" },
        delete = { text = "→" },
        topdelete = { text = "→" },
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
        local opts = { buffer = bufnr }
        local opts_expr = { buffer = bufnr, expr = true }
        local gs = package.loaded.gitsigns
        local desc = require("core.utils").desc

        -- Navigation between hunks with ]h and [h
        vim.keymap.set('n', ']h', function()
          if vim.wo.diff then return ']h' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, desc(opts_expr, "Next [h]unk"))

        vim.keymap.set('n', '[h', function()
          if vim.wo.diff then return '[h' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, desc(opts_expr, "Previous [h]unk"))

        -- Actions
        vim.keymap.set({ 'n', 'v' }, '<Leader>hs', '<cmd>Gitsigns stage_hunk<cr>', desc(opts, "[h]unk [s]tage"))
        vim.keymap.set({ 'n', 'v' }, '<Leader>hr', '<cmd>Gitsigns reset_hunk<cr>', desc(opts, "[h]unk [r]eset"))
        vim.keymap.set('n', '<Leader>hS', gs.stage_buffer, desc(opts, "[h]unk buffer [S]tage"))
        vim.keymap.set('n', '<Leader>hu', gs.undo_stage_hunk, desc(opts, "[h]unk [u]ndo stage"))
        vim.keymap.set('n', '<Leader>hR', gs.reset_buffer, desc(opts, "[h]unk buffer [R]eset"))
        vim.keymap.set('n', '<Leader>hb', gs.toggle_current_line_blame, desc(opts, "[h]unk git [b]lame"))

        -- Text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<cr>', desc(opts, '[i]nside [h]unk'))
      end,
    }
  },
}
