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
    ft = { "tex", "markdown" },
    dependencies = { "L3MON4D3/LuaSnip", "nvim-treesitter/nvim-treesitter" },
    opts = { use_treesitter = true }
  },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      'akinsho/org-bullets.nvim',
    },
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup({
        org_agenda_files = {'~/Documents/notes/*'},
        org_default_notes_file = '~/Documents/notes/refile.org',
        mappings = {
          org = { org_toggle_checkbox = '<LocalLeader><Space>' }
        }
      })

      require('org-bullets').setup({
        concealcursor = true,
        symbols = {
          checkboxes = {
            half = { '-', 'OrgTSCheckboxHalfChecked' },
            done = { '✓', 'OrgDone' },
            todo = { 'x', 'OrgTODO' },
          },
        },
      })
    end
  }
}
