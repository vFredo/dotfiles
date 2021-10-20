local theme = require("theme")
local colors = theme.colors

-- Helper functions for changging highlight groups
local function fg(group, color)
  vim.cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  vim.cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local function ui(group, gui)
  vim.cmd("hi " .. group .. " gui=" .. gui)
end

--
-- General
--
bg("LineNr", colors.bg)
fg_bg("CursorLineNr", colors.base04, colors.bg)
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)

-- Statusline
fg_bg("StatusLineNC", colors.bgAlt, "NONE")
bg("StatusLine", "NONE")

-- Italic Comments
ui("Comment", "italic")

-- Search
fg_bg("Search", colors.yellow, colors.bg)
ui("Search", "bold,underline")
ui("IncSearch", "bold")

-- Popup menu (autocomplete menu)
bg("Pmenu", colors.bgAlt)
fg_bg("PmenuSel", colors.bgAlt, colors.fg)

--
-- BlankIndent Lines
--
fg("IndentBlanklineChar", colors.base01)

--
-- LSP
--

-- Errors
fg_bg("LspDiagnosticsSignError", colors.red, "NONE")
fg("LspDiagnosticsVirtualTextError", colors.red)
fg_bg("LspDiagnosticsSignWarning", colors.yellow, "NONE")
fg("LspDiagnosticsVirtualTextWarning", colors.yellow)

-- Info
fg_bg("LspDiagnosticsSignInformation", colors.green, "NONE")
fg("LspDiagnosticsVirtualTextInformation", colors.green)

-- Hints
fg_bg("LspDiagnosticsSignHint", colors.magenta, "NONE")
fg("LspDiagnosticsVirtualTextHint", colors.magenta)

--
-- GitSigns
--
fg_bg("GitSignsAdd", colors.green, "NONE")
fg_bg("GitSignsChange", colors.blue, "NONE")
fg_bg("GitSignsChangeDelete", colors.red, "NONE")
fg_bg("GitSignsDelete", colors.red, "NONE")

--
-- Lsp neovim float window colors
--
bg("NormalFloat", colors.bgAlt)
fg_bg("FloatBorder", colors.fg, colors.bgAlt)

--
-- NvimTree
--
fg("NvimTreeRootFolder", colors.green)
ui("NvimTreeRootFolder", "underline")
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.cyan)
bg("NvimTreeNormal", colors.bgAlt)
bg("NvimTreeNormalNC", colors.bgAlt)
fg("NvimTreeIndentMarker", colors.fgAlt2)
fg_bg("NvimTreeEndOfBuffer", colors.bgAlt, colors.bgAlt)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg("NvimTreeFileDirty", colors.red)
fg("NvimTreeGitDirty", colors.red)
fg("NvimTreeGitDeleted", colors.red)
fg("NvimTreeExecFile", colors.fg)
bg("NvimTreeSignColumn", colors.bgAlt)
fg("NvimTreeSpecialFile", colors.magenta)
