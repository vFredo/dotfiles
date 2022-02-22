local ok, bufferline = pcall(require, "bufferline")
if not ok then
  error("Couldn't load bufferline " .. bufferline .. "\n")
end

local theme = require("core.theme")
local colors = theme.colors

bufferline.setup {
  options = {
    offsets = {{
      filetype = "NvimTree",
      text = "Files",
      highlight = "NvimTreeNormal"
    }},
    indicator_icon = '▎',
    modified_icon = '●',
    show_close_icon = false,
    show_buffer_close_icons = false,
    show_tab_indicators = true,
    separator_style = "thin"
  },
  highlights = {
    background = {
      guifg = colors.fgAlt,
      guibg = colors.bg,
    },
    fill = {
      guifg = colors.fgAlt2,
      guibg = colors.bg
    },

    -- Buffer
    buffer_visible = {
      guifg = colors.fgAlt,
      guibg = colors.bgAlt
    },
    buffer_selected = {
      guifg = colors.fgAlt2,
      guibg = colors.bgAlt2,
      gui = "bold"
    },

    -- Same buffer name
    duplicate_selected = {
      guifg = colors.fgAlt2,
      guibg = colors.bgAlt2,
      gui = "bold"
    },
    duplicate_visible = {
      guifg = colors.fgAlt,
      guibg = colors.bgAlt
    },
    duplicate = {
      guifg = colors.fgAlt,
      guibg = colors.bg
    },

    -- Modified
    modified = {
      guifg = colors.red,
      guibg = colors.bg
    },
    modified_selected = {
      guifg = colors.red,
      guibg = colors.bgAlt2
    },
    modified_visible = {
      guifg = colors.red,
      guibg = colors.bgAlt
    },

    -- Tabs
    tab = {
      guifg = colors.fgAlt,
      guibg = colors.bg
    },
    tab_selected = {
      guifg = colors.fgAlt2,
      guibg = colors.bgAlt2,
      gui = "bold"
    },

    -- Separator
    separator = {
      guifg = colors.bg,
      guibg = colors.bg
    },
    separator_selected = {
      guifg = colors.bg,
      guibg = colors.bg
    },
    separator_visible = {
      guifg = colors.bg,
      guibg = colors.bg
    },

    -- Indicator
    indicator_selected = {
      guifg = colors.blue,
      guibg = colors.bgAlt2,
    },
  }
}
