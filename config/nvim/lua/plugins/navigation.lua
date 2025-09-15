return {
  -- '.' command for repeating macros with plugins mappings
  { "tpope/vim-repeat", keys = { "." } },
  {
    -- Comment lines more easily and motions
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      init = function() vim.g.skip_ts_context_commentstring_module = true end,
      opts = { enable_autocmd = false }
    },
    keys = {
      { "gcc" }, { "gbc" }, { "gc", mode = "v" }, { "gb", mode = "v" }
    },
    config = function ()
      require("Comment").setup {
        ignore = '^$', -- ignore empty lines
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      }
    end
  },
  {
    -- Motions between parenthesis, brackets, etc...
    "kylechui/nvim-surround",
    version = "*",
    keys = {
      { "ys" }, { "cs" }, { "ds" }, { "gs", mode = "v" }
    },
    opts = { keymaps = { visual = "gs" } }
  },
  {
    -- Navigation between tmux and nvim
    "numToStr/Navigator.nvim",
    cmd = {
      "NavigatorLeft", "NavigatorRight",
      "NavigatorUp", "NavigatorDown"
    },
    keys = {
      { "<C-h>", "<cmd>NavigatorLeft<cr>",  mode = { "n", "v" } },
      { "<C-l>", "<cmd>NavigatorRight<cr>", mode = { "n", "v" } },
      { "<C-k>", "<cmd>NavigatorUp<cr>",    mode = { "n", "v" } },
      { "<C-j>", "<cmd>NavigatorDown<cr>",  mode = { "n", "v" } }
    },
    opts = { auto_save = 'current' }
  },
  {
    -- Easy navigation between lines with 's' and motions
    "ggandor/leap.nvim",
    keys = {
      { "gs",       "<Plug>(leap-from-window)" },
      { "s",        "<Plug>(leap-forward-to)" },
      { "S",        "<Plug>(leap-backward-to)" },
      { mode = "x", "x",                       "<Plug>(leap-forward-to)" },
      { mode = "x", "X",                       "<Plug>(leap-backward-to)" },
    },
  },
}
