local theme = require("theme")
local colors = theme.colors
local lsp = require "feline.providers.lsp"

-- styles for special icons and separators
local icon_styles = {
  default = {
    left = "",
    right = " ",
    main_icon = "   ",
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

--
-- Active statusline components
--

-- Vi mode colors with main icon
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

-- File icon
components.active[1][2] = {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(filename, extension)

    if icon == nil then
      icon = ""
    end

    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, color = require('nvim-web-devicons').get_icon_color(filename, extension)

    if icon ~= nil then
      val.fg = color
    else
      val.fg = colors.yellow
    end

    val.bg = colors.bgAlt
    return val
  end,
  left_sep = { str = icon_styles.block.left, hl = { bg = colors.bgAlt } },
  right_sep = { str = icon_styles.block.right, hl = { bg = colors.bgAlt } }
}

-- File name
components.active[1][3] = {
  provider = function()
    local parentFolder = vim.fn.expand("%:h:t")
    local filename = vim.fn.expand("%:t")

    -- No filename buffer
    if vim.fn.empty(filename) == 1 then
      filename = ''
    end

    if parentFolder ~= '.' and filename ~= '' then
      filename = parentFolder .. '/' .. filename
    end

    -- readonly file
    if vim.bo.readonly == true then
      filename = filename .. ' '
    end

    -- modified file
    if vim.bo.modifiable then
      if vim.bo.modified then
        filename = filename .. ' ●'
      end
    end

    return filename .. ' '
  end,
  hl = { bg = colors.bgAlt },
  right_sep = { str = icon_styles.default.right, hl = { fg = colors.bgAlt } }
}

-- diffAdded
components.active[1][4] = {
  provider = "git_diff_added",
  hl = { fg = colors.green },
  icon = "  ",
}

-- diffModfified
components.active[1][5] = {
  provider = "git_diff_changed",
  hl = { fg = colors.yellow },
  icon = "  ",
}
-- diffRemove
components.active[1][6] = {
  provider = "git_diff_removed",
  hl = { fg = colors.red },
  icon = "  ",
}

-- Diagnostic errors
components.active[1][7] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist "Error"
  end,
  hl = { fg = colors.red },
  icon = "  ",
}

-- Diagnostic warning
components.active[1][8] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist "Warning"
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

-- Diagnostic hints
components.active[1][9] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist "Hint"
  end,
  hl = { fg = colors.magenta },
  icon = "  ",
}

-- Diagnostic info
components.active[1][10] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist "Information"
  end,
  hl = { fg = colors.green },
  icon = "  ",
}

-- Check if a lsp server is running on file
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

-- Git branch info
components.active[3][2] = {
  provider = "git_branch",
  icon = "  ",
  hl = { fg = colors.yellow },
  right_sep = { str = icon_styles.block.right, hl = { fg = colors.bg } }
}

-- Icon for line porcentage
components.active[3][3] = {
  provider = icon_styles.default.position_icon,
  enabled = function()
    return vim.api.nvim_win_get_width(0) > 90
  end,
  hl = { fg = colors.bg, bg = colors.green },
  left_sep = { str = icon_styles.default.left, hl = { fg = colors.green } }
}

-- Line porcentage
components.active[3][4] = {
  provider = 'line_percentage',
  enabled = function()
    return vim.api.nvim_win_get_width(0) > 50
  end,
  hl = { fg = colors.green },
  left_sep = { str = icon_styles.block.left },
  right_sep = { str = icon_styles.block.right }
}

--
-- Inactive statusline components
--
components.inactive[1][1] = {
  hl = { bg = colors.bgAlt },
}

-- full path filename or just parent directory and filename if screen is to small
components.inactive[2][1] = {
  provider = function()
    local filename = vim.fn.expand("%:p")
    local shortFilename = vim.fn.expand("%:t")

    -- replace 'home/user' to '~'
    filename = filename:gsub(os.getenv("HOME"), '~')

    -- No filename, NvimTree and packer buffers
    if vim.fn.empty(shortFilename) == 1 or shortFilename:find('NvimTree') or shortFilename:find('packer')  then
      filename = ''
    end

    -- If filename is to big or screen to small, then show 'parent/filename'
    if filename:len() > 85 or (vim.api.nvim_win_get_width(0) < 60 and filename ~= '') then
      local parentFolder = vim.fn.expand("%:h:t")

      if parentFolder ~= '.' then
        filename = parentFolder .. '/' .. shortFilename
      else
        filename = shortFilename
      end
    end

    -- readonly file
    if vim.bo.readonly == true then
      filename = filename .. ' '
    end

    -- modified file
    if vim.bo.modifiable then
      if vim.bo.modified then
        filename = filename .. ' ●'
      end
    end

    return filename .. ' '
  end,
  hl = { fg = colors.grey, bg = colors.bgAlt, style = 'italic' },
}

local vi_mode_colors = {
  NORMAL = colors.blue,
  INSERT = colors.green,
  VISUAL = colors.magenta,
  LINES = colors.magenta,
  OP = colors.magenta,
  BLOCK = colors.magenta,
  REPLACE = colors.orange,
  ['V-REPLACE'] = colors.orange,
  ENTER = colors.yellow,
  MORE = colors.yellow,
  SELECT = colors.yellow,
  COMMAND = colors.red,
  TERM = colors.red,
  SHELL = colors.cyan,
  NONE = colors.cyan
}

-- Initialize feline statusline
require("feline").setup {
  colors = { fg = colors.fg, bg = colors.bg },
  components = components,
  vi_mode_colors = vi_mode_colors
}

