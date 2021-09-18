local ts_config = require("nvim-treesitter.configs")
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup{
  check_ts = true,
  enable_check_bracket_line = false,
}

-- Adding rule; add spaces between parentheses
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
    "python",
    "bash",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "html",
    "css"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  context_commentstring = { enable = true },
  autotag = { enable = true },
  autopairs = { enable = true },
}


vim.cmd([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])
