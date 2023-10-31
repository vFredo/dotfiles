local colors = require("core.colors")
local gruvbox_custom = {
  normal = {
    a = { bg = colors.fgAlt, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bgAlt, fg = colors.fgAlt },
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
  dependencies = "kyazdani42/nvim-web-devicons",
  opts = {
    options = {
      theme = gruvbox_custom,
      globalstatus = true,
      icons_enabled = true,
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {},
      lualine_b = { { 'branch', icon = '', color = { fg = colors.yellow }, }, 'diff' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn  = 'DiagnosticWarn',
          info  = 'DiagnosticInfo',
          hint  = 'DiagnosticHint',
        },
      } },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    }
  }
}
