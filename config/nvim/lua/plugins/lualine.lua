local colors = require("core.colors")
local gruvbox_custom = {
  normal = {
    a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  command = {
    a = { bg = colors.orange, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bgAlt2, fg = colors.fgAlt },
    c = { bg = colors.bg, fg = colors.fgAlt },
  },
  inactive = {
    a = { bg = colors.bgAlt, fg = colors.grey, gui = 'italic' },
    b = { bg = colors.bg, fg = colors.grey },
    c = { bg = colors.bg, fg = colors.grey },
  },
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
      section_separators = '',
    },
    sections = {
      lualine_a = { {
        'buffers',
        icons_enabled = false,
        use_mode_colors = true,
        max_length = vim.o.columns * 4 / 9,
      } },
      lualine_b = { 'branch', 'diff' },
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
      lualine_z = { 'location' }
    }
  }
}
