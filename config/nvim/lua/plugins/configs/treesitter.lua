local ts_config = require("nvim-treesitter.configs")
local npairs = require("nvim-autopairs")

npairs.setup{
  check_ts = true,
  enable_check_bracket_line = false,
}

ts_config.setup{
  ensure_installed = {
    "lua",
    "python",
    "go",
    "gomod",
    "c",
    "cpp",
    "bash",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "html",
    "css",
    "json",
    "latex"
  },
  highlight = { enable = true },
  context_commentstring = { enable = true },
  autotag = { enable = true },
  autopairs = { enable = true },
}

-- Folding config
vim.cmd([[
  set foldexpr=nvim_treesitter#foldexpr()
  set foldmethod=expr
  set foldlevelstart=99
]])
