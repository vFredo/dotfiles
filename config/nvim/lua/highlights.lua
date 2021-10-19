local theme = require("theme")
local colors = theme.colors

-- Helper functions for changging highlight groups
local function fg(group, color)
  vim.cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  vim.cmd("hi " .. group .. " guibg=" .. color)
end

local function fgbg(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local function ui(group, gui)
  vim.cmd("hi " .. group .. " gui=" .. gui)
end

--
-- General
--
bg("LineNr", colors.bg)
fgbg("CursorLineNr", colors.base04, colors.bg)
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)

-- Italic Comments
ui("Comment", "italic")

-- Search
fgbg("Search", colors.yellow, colors.bg)
ui("Search", "bold,underline")
ui("IncSearch", "bold")

-- Completition menu (Pop up)
bg("Pmenu", colors.bgAlt)
fgbg("PmenuSel", colors.bgAlt, colors.fg)

--
-- LSP
--

-- Errors
fg("LspDiagnosticsSignError", colors.red)
fg("LspDiagnosticsVirtualTextError", colors.red)
fg("LspDiagnosticsSignWarning", colors.yellow)
fg("LspDiagnosticsVirtualTextWarning", colors.yellow)

-- Info
fg("LspDiagnosticsSignInformation", colors.green)
fg("LspDiagnosticsVirtualTextInformation", colors.green)

-- Hints
fg("LspDiagnosticsSignHint", colors.magenta)
fg("LspDiagnosticsVirtualTextHint", colors.magenta)

--
-- GitSigns
--
fgbg("GitSignsAdd", colors.green, colors.bg)
fgbg("GitSignsChange", colors.blue, colors.bg)
fgbg("GitSignsChangeDelete", colors.red, colors.bg)
fgbg("GitSignsDelete", colors.red, colors.bg)

--
-- Lsp neovim float window colors
--
bg("NormalFloat", colors.bgAlt)
fgbg("FloatBorder", colors.fg, colors.bgAlt)

--
-- BlankIndent Lines
--
fg("IndentBlanklineChar", colors.base01)

--
-- NvimTree
--
fg("NvimTreeRootFolder", colors.green)
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.blue)
bg("NvimTreeNormal", colors.bgAlt)
bg("NvimTreeNormalNC", colors.bgAlt)
fg("NvimTreeIndentMarker", colors.fgAlt2)
fgbg("NvimTreeEndOfBuffer", colors.bgAlt, colors.bgAlt)
fgbg("NvimTreeVertSplit", colors.bg, colors.bg)
fg("NvimTreeFileDirty", colors.red)
fg("NvimTreeGitDirty", colors.red)
fg("NvimTreeGitDeleted", colors.red)
fg("NvimTreeExecFile", colors.fg)
bg("NvimTreeSignColumn", colors.bgAlt)
