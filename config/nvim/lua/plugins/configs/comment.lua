local ok, nvim_comment = pcall(require, "nvim_comment")
if not ok then
  vim.notify("Couldn't load nvim_comment " .. nvim_comment .. "\n")
end

nvim_comment.setup {
  comment_empty = false,
  hook = function()
    -- use treesitter to update the commentstring character
    require("ts_context_commentstring.internal").update_commentstring()
  end
}
