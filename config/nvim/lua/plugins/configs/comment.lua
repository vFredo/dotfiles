  require("nvim_comment").setup {
    comment_empty = false,
    hook = function()
      -- use treesitter to update the commentstring character
      local ts_comment = require("ts_context_commentstring.internal")
      ts_comment.update_commentstring()
    end
  }
