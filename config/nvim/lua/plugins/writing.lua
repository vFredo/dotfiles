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
    'nvim-orgmode/orgmode',
    ft = { 'org', 'orgagenda' },
    keys = {
      { '<leader>oa', '<cmd>lua require("orgmode").action("agenda.prompt")<cr>' },
      { '<leader>oc', '<cmd>lua require("orgmode").action("capture.prompt")<cr>' },
    },
    dependencies = {
      'akinsho/org-bullets.nvim',
      opts = {
        concealcursor = true,
        symbols = {
          checkboxes = {
            half = { "-", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { " ", "OrgTODO" },
          },
        }
      }
    },
    config = function()
      local org_path = '~/Documents/notes/'
      require('orgmode').setup_ts_grammar() -- Load treesitter grammar for org
      require('orgmode').setup({
        org_agenda_files = org_path .. '**/*',
        org_default_notes_file = org_path .. 'refile.org',
        org_todo_keywords = { 'TODO(t)', 'PROGRESS(p)', '|', 'DONE(d)', 'REJECTED(r)' },
        mappings = {
          org = { org_toggle_checkbox = "<Leader>tc" }
        },
        org_capture_templates = {
          r = {
            description = '[r]efile',
            template = '* TODO %?\n  DEADLINE: %T',
          },
          t = {
            description = '[t]odo',
            template = '* TODO %?\n  DEADLINE: %T',
            target = org_path .. 'todos.org',
          },
          w = {
            description = '[w]ork todo',
            template = '* TODO %?\n  DEADLINE: %T',
            target = org_path .. 'work.org',
          },
          d = {
            headline = 'Meetings',
            description = '[d]aily',
            template = '* Daily %U \n  %?',
            target = org_path .. 'work.org',
          },
        },
      })
    end,
  }
}
