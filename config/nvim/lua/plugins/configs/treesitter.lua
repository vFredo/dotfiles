local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  error("Couldn't load Treesitter " .. ts_config .. "\n")
end

ts_config.setup {
  ensure_installed = {
    "bash", "bibtex", "c", "cpp", "cmake", "make",
    "comment", "css", "scss", "dockerfile", "go", "gomod",
    "help", "html", "json", "json5", "jsdoc", "javascript",
    "typescript", "latex", "php", "python", "rust", "vim",
    "lua", "vue", "verilog", "yaml"
  },
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  autotag = { enable = true },
  autopairs = { enable = true },
  fold = { enable = true },
}
