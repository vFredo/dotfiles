return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
    "nvim-treesitter/playground",
  },
  opts = {
    auto_install = false,
    ensure_installed = {
      "bash", "c", "cpp", "make", "comment", "regex",
      "css", "scss", "dockerfile", "go", "gomod", "latex",
      "vimdoc", "html", "json", "javascript", "php", "bibtex",
      "typescript", "python", "rust", "vim", "lua", "vue",
      "yaml", "markdown", "markdown_inline", "org"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {'org'},
    },
    indent = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      config = {
        c = "// %s",
        cpp = "// %s",
      }
    },
  }
}
