local ok, bufferline = pcall(require, "bufferline")
if not ok then
  vim.notify("Couldn't load bufferline " .. bufferline .. "\n")
end

local colors = require("core.colors")

bufferline.setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "Files",
        highlight = "NvimTreeNormal"
      },
      {
        filetype = "fugitive",
        text = "Git",
        highlight = "NvimTreeNormal"
      }
    },
    indicator = {
      icon = '▎',
      style = 'icon'
    },
    show_tab_indicators = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    color_icons = true,
    modified_icon = '*',
    left_trunc_marker = '',
    right_trunc_marker = '',
    truncate_names = true,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, _, _, _)
      return '[' .. count .. ']'
    end
  },
  highlights = {
    -- Defaults
    background = { fg = colors.fgAlt, bg = colors.bg, },
    fill = { fg = colors.fgAlt2, bg = colors.bg },

    -- Buffer
    buffer_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    buffer_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2, bold = true },

    -- Duplicate buffer name
    duplicate = { fg = colors.fgAlt, bg = colors.bg },
    duplicate_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    duplicate_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2, bold = true },

    -- Indicator
    indicator_selected = { fg = colors.cyan, bg = colors.bgAlt2 },
    indicator_visible = { bg = colors.bgAlt },

    -- Modified
    modified = { fg = colors.red, bg = colors.bg },
    modified_visible = { fg = colors.red, bg = colors.bgAlt },
    modified_selected = { fg = colors.red, bg = colors.bgAlt2 },

    -- Tabs
    tab = { fg = colors.fgAlt, bg = colors.bg },
    tab_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2, bold = true },
    tab_separator = { fg = colors.bg, bg = colors.bg  },
    tab_separator_selected = { fg = colors.blue, bg = colors.bgAlt2 },

    -- Separator
    separator = { fg = colors.bg, bg = colors.bg },
    separator_selected = { fg = colors.bg, bg = colors.bg },
    separator_visible = { fg = colors.bg, bg = colors.bg },

    -- Info diagnostics
    info = { fg = colors.fg, bg = colors.bg },
    info_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    info_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2 },
    info_diagnostic = { fg = colors.blue, bg = colors.bg, bold = true, italic = true },
    info_diagnostic_visible = { fg = colors.blue, bg = colors.bgAlt, bold = true, italic = true },
    info_diagnostic_selected = { fg = colors.blue, bg = colors.bgAlt2, bold = true, italic = true },

    -- Hint diagnostic
    hint = { fg = colors.fg, bg = colors.bg },
    hint_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    hint_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2 },
    hint_diagnostic = { fg = colors.magenta, bg = colors.bg, bold = true, italic = true },
    hint_diagnostic_visible = { fg = colors.magenta, bg = colors.bgAlt, bold = true, italic = true },
    hint_diagnostic_selected = { fg = colors.magenta, bg = colors.bgAlt2, bold = true, italic = true },

    -- Warning diagnostics
    warning = { fg = colors.fg, bg = colors.bg },
    warning_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    warning_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2 },
    warning_diagnostic = { fg = colors.yellow, bg = colors.bg, bold = true, italic = true },
    warning_diagnostic_visible = { fg = colors.yellow, bg = colors.bgAlt, bold = true, italic = true },
    warning_diagnostic_selected = { fg = colors.yellow, bg = colors.bgAlt2, bold = true, italic = true },

    -- Error diagnostics
    error = { fg = colors.fg, bg = colors.bg },
    error_visible = { fg = colors.fgAlt, bg = colors.bgAlt },
    error_selected = { fg = colors.fgAlt2, bg = colors.bgAlt2 },
    error_diagnostic = { fg = colors.red, bg = colors.bg, bold = true, italic = true },
    error_diagnostic_visible = { fg = colors.red, bg = colors.bgAlt, bold = true, italic = true },
    error_diagnostic_selected = { fg = colors.red, bg = colors.bgAlt2, bold = true, italic = true },
  }
}
