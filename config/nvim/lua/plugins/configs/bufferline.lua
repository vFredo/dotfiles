local ok, bufferline = pcall(require, "bufferline")
if not ok then
  error("Couldn't load bufferline " .. bufferline .. "\n")
end

local theme = require("core.theme")
local colors = theme.colors

bufferline.setup {
  options = {
    offsets = { {
      filetype = "NvimTree",
      text = "Files",
      highlight = "NvimTreeNormal"
    } },
    indicator_icon = '▎',
    modified_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    max_name_length = 14,
    max_prefix_length = 13,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, _, _, _)
      return "[" .. count .. "]"
    end
  },
  highlights = {
    -- Defaults
    background = { guifg = colors.fgAlt, guibg = colors.bg, },
    fill = { guifg = colors.fgAlt2, guibg = colors.bg },

    -- Buffer
    buffer_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    buffer_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2, gui = "bold" },

    -- Duplicate buffer name
    duplicate_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2, gui = "bold" },
    duplicate_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    duplicate = { guifg = colors.fgAlt, guibg = colors.bg },

    -- Indicator
    indicator_selected = { guifg = colors.blue, guibg = colors.bgAlt2 },

    -- Modified
    modified = { guifg = colors.red, guibg = colors.bg },
    modified_selected = { guifg = colors.red, guibg = colors.bgAlt2 },
    modified_visible = { guifg = colors.red, guibg = colors.bgAlt },

    -- Tabs
    tab = { guifg = colors.fgAlt, guibg = colors.bg },
    tab_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2, gui = "bold" },

    -- Separator
    separator = { guifg = colors.bg, guibg = colors.bg },
    separator_selected = { guifg = colors.bg, guibg = colors.bg },
    separator_visible = { guifg = colors.bg, guibg = colors.bg },

    -- Info diagnostics
    info = { guifg = colors.fg, guibg = colors.bg },
    info_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    info_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2 },
    info_diagnostic = { guifg = colors.green, guibg = colors.bg },
    info_diagnostic_visible = { guifg = colors.green, guibg = colors.bgAlt },
    info_diagnostic_selected = { guifg = colors.green, guibg = colors.bgAlt2 },

    -- Hint diagnostic
    hint = { guifg = colors.fg, guibg = colors.bg },
    hint_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    hint_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2 },
    hint_diagnostic = { guifg = colors.magenta, guibg = colors.bg },
    hint_diagnostic_visible = { guifg = colors.magenta, guibg = colors.bgAlt },
    hint_diagnostic_selected = { guifg = colors.magenta, guibg = colors.bgAlt2 },

    -- Warning diagnostics
    warning = { guifg = colors.fg, guibg = colors.bg },
    warning_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    warning_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2, gui = "bold,italic" },
    warning_diagnostic = { guifg = colors.yellow, guibg = colors.bg },
    warning_diagnostic_visible = { guifg = colors.yellow, guibg = colors.bgAlt },
    warning_diagnostic_selected = { guifg = colors.yellow, guibg = colors.bgAlt2, gui = "bold,italic" },

    -- Error diagnostics
    error = { guifg = colors.fg, guibg = colors.bg },
    error_visible = { guifg = colors.fgAlt, guibg = colors.bgAlt },
    error_selected = { guifg = colors.fgAlt2, guibg = colors.bgAlt2, gui = "bold,italic" },
    error_diagnostic = { guifg = colors.red, guibg = colors.bg },
    error_diagnostic_visible = { guifg = colors.red, guibg = colors.bgAlt },
    error_diagnostic_selected = { guifg = colors.red, guibg = colors.bgAlt2, gui = "bold,italic" },
  }
}
