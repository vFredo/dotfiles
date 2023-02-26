local theme = require("core.theme")
local colors = theme.colors

--
-- Helper functions for changing highlight groups
--
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
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)
fg_bg("MatchParen", colors.bg, colors.orangeAlt, "bold")

-- Cursorline
fg_bg("CursorLine", "NONE", colors.bg)
fg_bg("CursorLineNr", colors.fgAlt2, colors.bg, "italic,bold")

-- Statusline active/inactive
fg_bg("StatusLineNC", colors.grey, colors.bgAlt)
fg_bg("StatusLine", colors.fgAlt2, colors.bgAlt2)

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
-- Plugins Highlights
--

-- nvim-cmp completion menu
fg("CmpItemAbbr", colors.grey) -- text autocomplete
fg("CmpItemKind", colors.blue) -- icon and kind info
ui("CmpItemMenu", "bold") -- source
fg("CmpItemAbbrMatchFuzzy", colors.blue, "italic") -- fuzzy match
fg("CmpItemAbbrDeprecated", colors.red, "strikethrough") -- ??

-- cmp Kind specific colors
fg("CmpItemKindFunction", colors.pink)
fg("CmpItemKindMethod", colors.pink)
fg("CmpItemKindKeyword", colors.fgAlt2)
fg("CmpItemKindProperty", colors.fgAlt2)
fg("CmpItemKindUnit", colors.fgAlt2)
fg("CmpItemKindClass", colors.orange)
fg("CmpItemKindStruct", colors.orange)
fg("CmpItemKindInterface", colors.yellow)
fg("CmpItemKindEvent", colors.yellow)

-- BlankIndent Lines
fg("IndentBlanklineChar", colors.bgAlt2)
fg("IndentBlanklineContextChar", colors.grey)
fg("IndentBlanklineSpaceChar", colors.grey)

-- LSP config
fg("DiagnosticError", colors.red)
fg("DiagnosticWarn", colors.yellow)
fg("DiagnosticInfo", colors.blue)
fg("DiagnosticHint", colors.magenta)

-- LSP neovim float window colors
bg("NormalFloat", colors.bgAlt)
fg_bg("FloatBorder", colors.fg, colors.bgAlt)

-- GitSigns and fugitive
fg("GitSignsAdd", colors.green)
fg("GitSignsChange", colors.blue)
fg("GitSignsChangeDelete", colors.red)
fg("GitSignsDelete", colors.red)
fg("DiffRemoved", colors.red)
fg("fugitiveHash", colors.red)
fg("fugitiveUnstagedHeading", colors.red)
fg("fugitiveStagedHeading", colors.green)
fg("gitcommitOverflow", colors.red)

-- Treesitter nodes highlight colors
fg("@repeat", colors.purple)
fg("@field", colors.red)
fg("@variable", colors.fg)
fg("@property", colors.fg)
fg("@variable.builtin", colors.yellow)
fg("@text.literal", colors.orange)
fg("@text.reference", colors.yellow)
fg("@text.uri", colors.cyan)
fg("@text.title", colors.purple)

-- Telescope
fg("TelescopeBorder", colors.grey)
fg("TelescopeTitle", colors.fgAlt2)

-- Leap
fg("LeapMatch", colors.yellow, "bold,underline,nocombine")
fg_bg("LeapLabelPrimary", colors.bg, colors.yellow, "bold")
fg_bg("LeapLabelSecondary", colors.bg, colors.blue, "bold")

-- NvimTree
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
fg("NvimTreeOpenedFile", colors.orange, "underline")
