local M = {  }

M.tree_setup = function ()
  local g = vim.g
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_highlight_opened_files = 2
  g.nvim_tree_width_allow_resize = 1
  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "凜",
      untracked = "",
      deleted = "",
      ignored = ""
    },
  }
end

M.tree_config = function ()
  local ok, tree = pcall(require, "nvim-tree")
  if not ok then
    error("Couldn't load nvim-tree " .. tree .. "\n")
  end
  tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_tab = false,
    auto_close = true,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = { enable = true, update_cwd = false },
    update_to_buf_dir = { enable = false, auto_open = true },
    git = { ignore = false },
    view = {
      width = 30,
      side = 'left',
      auto_resize = false
    },
    filters = {
      dotfiles = true,
      custom = {
        "^node_modules/", "^.git/", "^.cache/", "%.o", "%.pdf", "%.class", "%.obj"
      },
    },
  }
end

return M
