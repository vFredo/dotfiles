local theme = require("theme")
local colors = theme.colors

local lsp = require "feline.providers.lsp"

local icon_styles = {
  default = {
    left = "",
    right = " ",
    main_icon = "   ",
    vi_mode_icon = " ",
    position_icon = " ",
  },
  block = {
    left = " ",
    right = " ",
  },
}

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

-- Initialize left, mid and right of components active and incactive
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

components.active[1][1] = {
  provider = icon_styles.default.main_icon,
  hl = function()
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      bg = require('feline.providers.vi_mode').get_mode_color(),
      fg = colors.bgAlt,
      style = 'bold'
    }
  end,
  left_sep = {
    str = icon_styles.block.left,
    hl = function()
      return {
        fg = colors.bgAlt,
        bg = require('feline.providers.vi_mode').get_mode_color(),
      }
    end,
  },
  right_sep = {
    str = icon_styles.default.right,
    hl = function()
      return {
        fg = require('feline.providers.vi_mode').get_mode_color(),
        bg = colors.bgAlt,
      }
    end,
  }
}

components.active[1][2] = {
  provider = 'file_info',
  colored_icon = true,
  type = 'short-path',
  file_readonly_icon = '',
  hl = { bg = colors.bgAlt },
  right_sep = {
    str = icon_styles.default.right,
    hl = { fg = colors.bgAlt }
  },
  left_sep = {
    str = icon_styles.block.left,
    hl = { bg = colors.bgAlt }
  }
}

components.active[1][3] = {
  provider = "git_diff_added",
  hl = { fg = colors.green },
  icon = " ",
}
-- diffModfified
components.active[1][4] = {
  provider = "git_diff_changed",
  hl = { fg = colors.yellow },
  icon = "   ",
}
-- diffRemove
components.active[1][5] = {
  provider = "git_diff_removed",
  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][6] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist "Error"
  end,
  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][7] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist "Warning"
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

components.active[1][8] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist "Hint"
  end,
  hl = { fg = colors.magenta },
  icon = "  ",
}

components.active[1][9] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist "Information"
  end,
  hl = { fg = colors.green },
  icon = "  ",
}

components.active[3][1] = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
       return "  LSP"
    else
       return ""
    end
  end,
  enabled = function()
    return vim.api.nvim_win_get_width(0) > 70
  end,
  hl = { fg = colors.fgAlt2 },
}

components.active[3][2] = {
  provider = "git_branch",
  icon = "  ",
  hl = { fg = colors.yellow },
  right_sep = {
    str = icon_styles.block.right,
    hl = { fg = colors.bg },
  }
}

components.active[3][3] = {
  provider = icon_styles.default.position_icon,
  enabled = function()
    return vim.api.nvim_win_get_width(0) > 90
  end,
  hl = { fg = colors.bg, bg = colors.green },
  left_sep = {
    str = icon_styles.default.left,
    hl = { fg = colors.green },
  }
}

components.active[3][4] = {
  provider = 'line_percentage',
  enabled = function()
    return vim.api.nvim_win_get_width(0) > 70
  end,
  left_sep = ' ',
  hl = { fg = colors.green },
}

--
-- Inactive components of statusline
--
components.inactive[1][1] = {
  provider = "",
  hl = { fg = colors.fgAlt2, bg = colors.bgAlt, style = 'italic' },
}

components.inactive[2][1] = {
  provider = 'file_info',
  type = 'full-path',
  file_readonly_icon = '',
  hl = { fg = colors.fgAlt2, bg = colors.bgAlt, style = 'italic' },
}

local vi_mode_colors = {
  NORMAL = colors.blue,
  INSERT = colors.green,
  VISUAL = colors.magenta,
  LINES = colors.magenta,
  OP = colors.magenta,
  BLOCK = colors.magenta,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.yellow,
  MORE = colors.yellow,
  SELECT = colors.cyan,
  COMMAND = colors.cyan,
  SHELL = colors.green,
  TERM = colors.grey,
  NONE = colors.grey
}

require("feline").setup {
  colors = { fg = colors.fg, bg = colors.bg },
  components = components,
  vi_mode_colors = vi_mode_colors
}

