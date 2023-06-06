return {
  -- Autocomplete parenthesis, brackets, etc...
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup({
      check_ts = true,
      disable_filetype = { "TelescopePrompt" },
      ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
      enable_check_bracket_line = false,
    })

    --
    -- Rules
    --
    local Rule = require("nvim-autopairs.rule")

    -- Add spaces between parentheses
    npairs.add_rules {
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
      Rule("(", ")"):with_pair(function(opts)
        return opts.prev_char:match ".%)" ~= nil
      end):use_key ")",
      Rule("{", "}"):with_pair(function(opts)
        return opts.prev_char:match ".%}" ~= nil
      end):use_key "}",
      Rule("[", "]"):with_pair(function(opts)
        return opts.prev_char:match ".%]" ~= nil
      end):use_key "]",
    }

    -- cmp integration
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end
}
