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
    "rust", "vim", "lua", "vue", "verilog", "yaml"
  },
  highlight = { enable = true, use_languagetree = false },
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
  autopairs = { enable = true },
  fold = { enable = true },
}
