return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false,
      ensure_installed = {
        "bash", "c", "cpp", "make", "comment", "regex",
        "css", "dockerfile", "go", "gomod", "latex",
        "vimdoc", "html", "json", "javascript", "php", "bibtex",
        "typescript", "python", "rust", "vim", "lua",
        "yaml", "markdown", "markdown_inline", "org"
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
      }
    })
    -- Folds with treesitter
    vim.opt.foldmethod  = "expr"
    vim.opt.foldexpr    = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable  = false -- don't fold when open file
  end
}
