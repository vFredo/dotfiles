local colors = require("core.colors")

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
fg("Underlined", colors.cyan)
fg("EndOfBuffer", colors.bg)
fg_bg("MatchParen", colors.bg, colors.yellow, "bold")

-- Cursorline
fg_bg("CursorLineNr", colors.fgAlt2, colors.bg, "italic,bold")

-- Statusline active/inactive
fg_bg("StatusLineNC", colors.grey, colors.bgAlt)
fg_bg("StatusLine", colors.fgAlt2, colors.bgAlt2)

-- Comments
ui("Comment", "italic")

-- Search
fg_bg("Search", colors.yellow, colors.bg, "bold,underline")
fg_bg("IncSearch", colors.bg, colors.yellow, "bold")

-- Spell colors
fg("SpellBad", colors.red)
fg("SpellRare", colors.yellow)
fg("SpellCap", colors.blue)

-- Popup menu (default completion menu)
bg("Pmenu", colors.bgAlt)                         -- completition box
fg_bg("PmenuSel", colors.bg, colors.blue, "bold") -- item selected
bg("PmenuSbar", colors.bgAlt)                     -- scrollbar
bg("PmenuThumb", colors.fgAlt)                    -- thumb scrollbar

--
-- Plugins Highlights
--

-- nvim-cmp completion menu
fg("CmpItemAbbr", colors.grey)                           -- text autocomplete
fg("CmpItemKind", colors.blue)                           -- icon and kind info
ui("CmpItemMenu", "bold")                                -- source
fg("CmpItemAbbrMatchFuzzy", colors.blue, "italic")       -- fuzzy match
fg("CmpItemAbbrDeprecated", colors.red, "strikethrough") -- ??

-- cmp Kind specific colors
fg("CmpItemKindFunction", colors.purple)
fg("CmpItemKindMethod", colors.purple)
fg("CmpItemKindKeyword", colors.fgAlt2)
fg("CmpItemKindProperty", colors.fgAlt2)
fg("CmpItemKindUnit", colors.fgAlt2)
fg("CmpItemKindClass", colors.orange)
fg("CmpItemKindStruct", colors.orange)
fg("CmpItemKindInterface", colors.yellow)
fg("CmpItemKindEvent", colors.yellow)

-- BlankIndent Lines
fg("IblIndent", colors.bgAlt2)

-- LSP config
fg_bg("DiagnosticError", colors.red, colors.bg)
fg_bg("DiagnosticWarn", colors.yellow, colors.bg)
fg_bg("DiagnosticInfo", colors.blue, colors.bg)
fg_bg("DiagnosticHint", colors.magenta, colors.bg)

-- LSP neovim float window colors
bg("NormalFloat", colors.bgAlt)
fg_bg("FloatBorder", colors.fg, colors.bgAlt)

-- GitSigns and fugitive
fg("GitSignsAdd", colors.green)
fg("GitSignsChange", colors.blue)
fg("GitSignsChangeDelete", colors.red)
fg("GitSignsDelete", colors.red)
fg("DiffRemoved", colors.red)
fg("fugitiveStagedHeading", colors.green)

-- Lsp Highlight colors
fg("Function", colors.blue)
fg("Repeat", colors.purple)
fg("Statement", colors.purple)
fg("Operator", colors. orange)
fg("@lsp.type.property", colors.red)
fg("@lsp.type.variable", colors.fg)
fg("@lsp.type.class", colors.yellow)
fg("@lsp.type.enum", colors.yellow)
fg("@lsp.type.interface", colors.yellow)
fg("@lsp.typemod.variable.global", colors.yellow)

-- Treesitter/LSP highlight colors
fg("Funcion", colors.blue)
fg("Structure", colors.orange)
fg("@lsp.type.function", colors.blue)
fg("@lsp.type.method", colors.blue)

-- Telescope
fg("TelescopePromptBorder", colors.bgAlt2)
fg("TelescopePreviewBorder", colors.bgAlt2)
fg("TelescopeResultsBorder", colors.bgAlt2)
fg("TelescopeTitle", colors.fgAlt2)
bg("TelescopeSelection", colors.bgAlt2)

-- Leap
fg("LeapMatch", colors.orangeAlt, "bold,underline,nocombine")
fg_bg("LeapLabelPrimary", colors.bg, colors.orangeAlt, "bold")
fg_bg("LeapLabelSecondary", colors.bg, colors.blue, "bold")

-- Noice
fg("NoiceCmdlinePopupBorder", colors.grey)
fg_bg("NoiceCmdlineicon", colors.red, colors.bg)
fg_bg("NoiceFormatProgressTodo", colors.red, colors.bgAlt2)
fg_bg("NoiceFormatProgressDone", colors.green, colors.bgAlt2)

-- Notify
fg("NotifyERRORTitle", colors.red)
fg("NotifyERRORIcon", colors.red)
fg("NotifyERRORBorder", colors.red)

fg("NotifyWARNTitle", colors.yellow)
fg("NotifyWARNIcon", colors.yellow)
fg("NotifyWARNBorder", colors.yellow)

fg("NotifyINFOTitle", colors.green)
fg("NotifyINFOIcon", colors.green)
fg("NotifyINFOBorder", colors.green)

fg("NotifyDEBUGTitle", colors.magenta)
fg("NotifyDEBUGIcon", colors.magenta)
fg("NotifyDEBUGBorder", colors.magenta)

fg("NotifyTRACETitle", colors.cyan)
fg("NotifyTRACEIcon", colors.cyan)
fg("NotifyTRACEBorder", colors.cyan)

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
fg("NvimTreeSpecialFile", colors.purple)
fg("NvimTreeOpenedFile", colors.orangeAlt, "underline")
