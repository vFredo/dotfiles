local ts_config = require("nvim-treesitter.configs")
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup{
  check_ts = true,
  map_bs = false
}

-- Add spaces between parentheses
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
  Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
}

ts_config.setup{
  ensure_installed = {
    "lua",
    "vim",
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
    "latex",
    "comment",
    "jsdoc"
  },
  highlight = { enable = true },
  indent = { enable = true },
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
