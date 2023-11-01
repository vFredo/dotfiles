local colors = require("core.colors")
local gruvbox_custom = {
  normal = {
    a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  inactive = {
    a = { bg = colors.bgAlt, fg = colors.fgAlt, gui = 'italic' },
    b = { bg = colors.bg, fg = colors.grey },
    c = { bg = colors.bg, fg = colors.grey },
  },
  insert = { a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' }, },
  visual = { a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' }, },
  replace = { a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' }, },
  command = { a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' }, },
}

return {
  "nvim-lualine/lualine.nvim",
  after = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      theme = gruvbox_custom,
      globalstatus = true,
      icons_enabled = true,
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    tabline = {
      lualine_a = { {
        'filename',
        path = 1,
        right_padding = 2,
        separator = { left = '', right = '' },
        symbols = { modified = '●', readonly = '󰌾' }
      } },
      lualine_b = { { 'branch', icon = '', color = { fg = colors.yellow }, }, 'diff' },
      lualine_c = { {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
      } },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
  }
}
