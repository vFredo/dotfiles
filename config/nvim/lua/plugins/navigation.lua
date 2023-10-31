return {
  {
    -- Comment lines more easily and motions
    'numToStr/Comment.nvim',
    keys = {
      { "gcc" }, { "gbc" }, { "gc", mode = "v" }, { "gb", mode = "v" }
    },
    config = function()
      require('Comment').setup({
        ignore = '^$', -- ignore empty lines
        pre_hook = function(...)
          local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
          if loaded and ts_comment then
            return ts_comment.create_pre_hook()(...)
          end
        end
      })
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
    opts = { auto_save = 'current' }
  },

  -- '.' command for repeating macros with plugins
  { "tpope/vim-repeat", keys = { "." } },
}
