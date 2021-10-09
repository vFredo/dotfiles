local g = vim.g
local tree = require("nvim-tree")

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_ignore = { '.cache', '.git', 'node_modules' }

tree.setup{
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  auto_close = true,
  lsp_diagnostics = true,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  view = {
    side = 'left',
    auto_resize = true,
    width = 30,
    height = 30,
  }
}
