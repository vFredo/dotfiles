return {
  {
    -- Latex integration
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_quickfix_mode = 0
    end
  },
  {
    -- latex snippets
    "iurimateus/luasnip-latex-snippets.nvim",
    ft = "tex",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = { use_treesitter = true }
  },
  {
    -- Note taking and TODO's
    'nvim-orgmode/orgmode',
    ft = 'org',
    keys = {
      { '<Leader>oa', desc = "[o]rg [a]genda" },
      { '<Leader>oc', desc = "[o]rg [c]apture" }
    },
    dependencies = {
      'akinsho/org-bullets.nvim',
      opts = {
        concealcursor = true,
        symbols = {
          headlines = { "◈", "◇", "❖", "⋄", "◆", "⟡" },
          checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "", "OrgDone" },
            todo = { " ", "OrgTODO" },
          },
        }
      }
    },
    config = function()
      local org_path = '~/Documents/notes/'
      local colors = require("core.colors")

      require('orgmode').setup_ts_grammar() -- Load treesitter grammar for org
      require('orgmode').setup({
        org_agenda_files = org_path .. '**/*',
        org_default_notes_file = org_path .. 'refile.org',
        org_todo_keywords = { 'TODO(t)', 'WAITING', 'PROGRESS', '|', 'DONE(d)', 'CANCELLED' },
        org_todo_keyword_faces = {
          ['PROGRESS'] = ':foreground ' .. colors.yellow .. ' :weight bold',
          ['WAITING'] = ':foreground ' .. colors.orange .. ' :weight bold',
          ['CANCELLED'] = ':foreground ' .. colors.fgAlt .. ' :weight bold',
        },
        org_deadline_warning_days = 5,
        win_split_mode = 'vertical',
        mappings = {
          org = { org_toggle_checkbox = "<Leader>tc" }
        },
        org_capture_templates = {
          n = { description = '[n]ote', template = '* %?\n  %a' },
          t = {
            description = '[t]odo',
            template = '* TODO %?\n  DEADLINE: %u\n  %a',
          },
          e = {
            description = '[e]vent',
            template = '* TODO %?\n  SCHEDULED: %u',
          },
        },
        notifications = {
          enabled = true,
          repeater_reminder_time = false,
          deadline_warning_reminder_time = true,
          reminder_time = 10,
          deadline_reminder = true,
          scheduled_reminder = true,
        },
      })
    end,
  }
}
