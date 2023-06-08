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

    -- cmp integration
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end
}
