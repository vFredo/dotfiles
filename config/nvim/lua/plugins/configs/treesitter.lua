local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  error("Couldn't load Treesitter " .. ts_config .. "\n")
end

ts_config.setup {
  ensure_installed = {
    "bash", "c", "cpp", "cmake", "make", "comment",
    "css", "scss", "dockerfile", "go", "gomod",
    "help", "html", "json", "json5", "jsdoc",
    "javascript", "typescript", "php", "python",
    "rust", "vim", "lua", "vue","yaml", "markdown"
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
