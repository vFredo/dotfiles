local g = vim.g

local M = {  }

M.tree_setup = function ()
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_highlight_opened_files = 2
  g.nvim_tree_width_allow_resize = 1
  g.nvim_tree_gitignore = 0
  g.nvim_tree_icons = {
    default = "",
    symlink = "",
  }
end

M.tree_config = function ()
  local ok, tree = pcall(require, "nvim-tree")
  if not ok then
    return
  end
  tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    auto_close = true,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = { enable = true, update_cwd = false },
    update_to_buf_dir = { enable = false, auto_open = true },
    view = {
      width = 30,
      side = 'left',
      auto_resize = true
    },
    filters = {
      dotfiles = true,
      custom = { "^.git/", "^node_modules/", "^.cache/" } -- ignore this
    },
  }
end

return M
