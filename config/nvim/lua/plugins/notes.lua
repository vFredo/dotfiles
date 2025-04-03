return {
  {
    -- Latex integration
    "lervag/vimtex",
    ft = "tex",
    init = function()
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
      "nvim-treesitter/nvim-treesitter",
      "lervag/vimtex"
    },
    config = true
  },
}
