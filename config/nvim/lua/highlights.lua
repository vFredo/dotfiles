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
fg_bg("CursorLineNr", colors.fgAlt2, colors.bg)
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)

-- Statusline active/inactive
fg_bg("StatusLineNC", colors.bgAlt, colors.bg .. " gui=underline")
fg_bg("StatusLine", colors.bgAlt, colors.bg .. " gui=underline")

-- Italic Comments
ui("Comment", "italic")

-- Search
fg_bg("Search", colors.yellow, colors.bg .. " gui=bold,underline")
ui("IncSearch", "bold")

-- Popup menu (autocomplete menu)
bg("Pmenu", colors.bgAlt)
fg_bg("PmenuSel", colors.bgAlt, colors.fg)

--
-- BlankIndent Lines
--
fg("IndentBlanklineChar", colors.bgAlt)

--
-- LSP
--

-- Errors
fg("LspDiagnosticsSignError", colors.red)
fg("LspDiagnosticsVirtualTextError", colors.red)

-- Warnings
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
fg("GitSignsAdd", colors.green)
fg("GitSignsChange", colors.blue)
fg("GitSignsChangeDelete", colors.red)
fg("GitSignsDelete", colors.red)

--
-- Lsp neovim float window colors
--
bg("NormalFloat", colors.bgAlt)
fg_bg("FloatBorder", colors.fg, colors.bgAlt)

--
-- NvimTree
--
fg("NvimTreeRootFolder", colors.green .. " gui=underline")
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

--
-- Neogit
--
fg_bg("NeogitDiffAddHighlight", colors.green, colors.bgAlt)
fg_bg("NeogitDiffDeleteHighlight", colors.red, colors.bgAlt)
fg_bg("NeogitHunkHeader", colors.blue , colors.bgAlt)
bg("NeogitDiffContextHighlight", colors.bgAlt)
fg_bg("NeogitHunkHeaderHighlight", colors.yellow, colors.bgAlt)
