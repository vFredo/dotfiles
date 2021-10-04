local g = vim.g
local tree = require("nvim-tree")

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_ignore = { ".cache", ".git", "node_modules", "data" }

tree.setup{
  update_focused_file = {
    enable = false,
    auto_open = false
  },
  lsp_diagnostics = true,
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
  }
}
