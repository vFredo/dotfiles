local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Couldn't load Treesitter " .. ts_config .. "\n")
end

ts_config.setup {
  auto_install = false,
  ensure_installed = {
    "bash", "c", "cpp", "make", "comment", "regex",
    "css", "scss", "dockerfile", "go", "gomod", "latex",
    "vimdoc", "html", "json", "javascript", "php", "bibtex",
    "typescript", "python", "rust", "vim", "lua", "vue",
    "yaml", "markdown", "markdown_inline"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
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
