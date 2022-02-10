local theme = require("core.theme")
local colors = theme.colors

-- Helper functions for changing highlight groups
local function fg(group, color, opts)
  local gui = opts or ''
  if gui ~= '' then
    vim.cmd("hi " .. group .. " guifg=" .. color .. " gui=" .. gui)
  else
    vim.cmd("hi " .. group .. " guifg=" .. color)
  end
end

local function bg(group, color, opts)
  local gui = opts or ''
  if gui ~= '' then
    vim.cmd("hi " .. group .. " guibg=" .. color .. " gui=" .. gui)
  else
    vim.cmd("hi " .. group .. " guibg=" .. color)
  end
end

local function fg_bg(group, fgcol, bgcol, opts)
  local gui = opts or ''
  if gui ~= '' then
    vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol .. " gui=" .. gui)
  else
    vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
  end
end

local function ui(group, gui)
  vim.cmd("hi " .. group .. " gui=" .. gui)
end

--
-- General
--
bg("LineNr", colors.bg)
vim.cmd("hi clear CursorLine") -- disable cursorline
fg_bg("CursorLineNr", colors.fgAlt2, colors.bg, "italic,bold")
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)

-- Statusline active/inactive
fg_bg("StatusLineNC", colors.bgAlt, colors.bg, "underline")
fg_bg("StatusLine", colors.bgAlt, colors.bg, "underline")

-- Italic Comments
ui("Comment", "italic")

-- Search
fg_bg("Search", colors.yellow, colors.bg, "bold,underline")
fg_bg("IncSearch", colors.bg, colors.yellow, "bold")

-- Spell colors
fg("SpellBad", colors.orangeAlt)
fg("SpellRare", colors.yellow)
fg("SpellCap", colors.blue)

-- Popup menu (default completion menu)
bg("Pmenu", colors.bgAlt) -- completition box
fg_bg("PmenuSel", colors.bgAlt, colors.blue, "bold") -- item selected
bg("PmenuSbar", colors.bgAlt) -- scrollbar
bg("PmenuThumb", colors.fgAlt) -- thumb scrollbar

--
-- nvim-cmp completion menu
--
fg("CmpItemAbbr", colors.grey) -- text autocomplete
fg("CmpItemKind", colors.blue) -- icon and kind info
ui("CmpItemMenu", "bold") -- source
fg("CmpItemAbbrMatchFuzzy", colors.blue, "italic") -- fuzzy match
fg("CmpItemAbbrDeprecated", colors.red, "italic") -- ??

--
-- BlankIndent Lines
--
fg("IndentBlanklineChar", colors.bgAlt2)

--
-- LSP
--
fg("DiagnosticError", colors.red)
fg("DiagnosticWarn", colors.yellow)
fg("DiagnosticInformation", colors.green)
fg("DiagnosticHint", colors.magenta)

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

-- Telescope
fg("TelescopeBorder", colors.grey)
fg("TelescopeTitle", colors.fgAlt2)

--
-- NvimTree
--
fg("NvimTreeRootFolder", colors.blue, "italic")
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.cyan)
bg("NvimTreeNormal", colors.bgAlt)
bg("NvimTreeNormalNC", colors.bgAlt)
fg("NvimTreeIndentMarker", colors.fgAlt)
fg_bg("NvimTreeEndOfBuffer", colors.bgAlt, colors.bgAlt)
fg_bg("NvimTreeVertSplit", colors.bg, colors.bg)
fg("NvimTreeFileDirty", colors.red)
fg("NvimTreeGitDirty", colors.red)
fg("NvimTreeGitDeleted", colors.red)
fg("NvimTreeExecFile", colors.fg)
bg("NvimTreeSignColumn", colors.bgAlt)
fg("NvimTreeSpecialFile", colors.pink)
fg("NvimTreeOpenedFile", colors.yellow)
