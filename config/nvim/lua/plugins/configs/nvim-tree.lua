local g = vim.g
local tree = require("nvim-tree")

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  folder = {
    symlink = "",
    symlink_open = "",
  }
}

tree.setup{
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  view = {
    side = 'left',
    auto_resize = true,
    width = 30
  }
}
