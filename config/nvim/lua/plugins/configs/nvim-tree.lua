local ok, tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("Couldn't load nvim-tree " .. tree .. "\n")
end

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = false },
  git = { ignore = false },
  view = {
    width = 32,
    side = 'left',
    preserve_window_proportions = true,
    mappings = {
      custom_only = true,
      list = {
        { key = { 'l', '<CR>', '<2-LeftMouse>' }, action = 'edit' },
        { key = 'L', action = 'cd' },
        { key = '<C-s>', action = 'split' },
        { key = '<C-v>', action = 'vsplit' },
        { key = '<C-t>', action = 'tabnew' },
        { key = 'h', action = 'close_node' },
        { key = 'i', action = 'preview' },
        { key = 'R', action = 'refresh' },
        { key = 'c', action = 'create' },
        { key = 'D', action = 'remove' },
        { key = 'r', action = 'rename' },
        { key = 'd', action = 'cut' },
        { key = 'y', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'gyn', action = 'copy_name' },
        { key = 'gyp', action = 'copy_path' },
        { key = 'gya', action = 'copy_absolute_path' },
        { key = 'H', action = 'dir_up' },
        { key = 's', action = 'system_open' },
        { key = 'q', action = 'close' },
      },
    },
  },
  filters = {
    dotfiles = true,
    custom = {
      "^node_modules/", "^.git/",
      "^.cache/", "%.o", "%.pdf",
      "%.class", "%.obj"
    },
  },
  renderer = {
    indent_markers = { enable = true },
    root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
    highlight_opened_files = "name",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          unmerged = "",
          staged = "S",
          unstaged = "",
          untracked = "U"
        },
      }
    }
  }
}
