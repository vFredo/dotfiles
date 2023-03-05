local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("Couldn't load Treesitter " .. ts_config .. "\n")
end

ts_config.setup {
  ensure_installed = {
    "bash", "c", "cpp", "make", "comment", "regex",
    "css", "scss", "dockerfile", "go", "gomod",
    "help", "html", "json", "javascript", "php",
    "typescript", "python", "rust", "vim", "lua",
    "vue", "yaml", "markdown", "markdown_inline"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
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
  autotag = { enable = true },
  fold = { enable = true },
}
