local theme = {}

theme.colors = {
  bg = "#1d2021",
  fg = "#d5c4a1",
  red = "#ea6962",
  green = "#a9b665",
  yellow = "#d8a657",
  blue = "#7daea3",
  magenta = "#93869b",
  purple = "#d3869b",
  cyan = "#89b482",
  grey = "#665c54",
  orange = "#e78a4e",
  orangeAlt = "#dd8044",
  pink = "#ce8196",

  -- Alternative colors
  bgAlt = "#282828",
  bgAlt2 = "#32302f",
  fgAlt = "#bdae93",
  fgAlt2 = "#ebdbb2",
}

local function delHash(hex)
  return hex:gsub("#", "")
end

local c = theme.colors

local style = {
  b00 = delHash(c.bg), -- Default Background
  b01 = delHash(c.bgAlt), -- Lighter bg (Used for statusbar, line number and folding)
  b02 = delHash(c.bgAlt2), -- Selection Background
  b03 = delHash(c.grey), -- Comments, Invisibles, Line Highlighting
  b04 = delHash(c.fgAlt), -- Dark Foreground (Used for status bars)
  b05 = delHash(c.fg), -- Default Foreground, Caret, Delimiters, Operators
  b06 = delHash(c.fgAlt2), -- Light Foreground
  b07 = delHash(c.fg), -- Light Background
  b08 = delHash(c.red), -- Var, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  b09 = delHash(c.yellow), -- Ints, Bool, Constants, XML Attributes, Markup Link Url
  b0A = delHash(c.yellow), -- Classes, Markup Bold, Search Text Background
  b0B = delHash(c.green), -- Strings, Inherited Class, Markup Code, Diff Inserted
  b0C = delHash(c.cyan), --  Regular Expressions, Escape Characters, Markup Quotes
  b0D = delHash(c.blue), -- Functions, Methods, Attribute IDs, Headings
  b0E = delHash(c.purple), -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  b0F = delHash(c.red) -- Opening/Closing Embedded Language Tags
}

-- Just return the colors if base16 couldn't load
local ok, base16 = pcall(require, "base16")

if not ok then
  vim.notify("Couldn't load theme: " .. base16)
  return theme
end

-- Set base16 neovim theme
base16.themes["gruvbox-material-custom"] = {
  base00 = style.b00; base01 = style.b01; base02 = style.b02; base03 = style.b03;
  base04 = style.b04; base05 = style.b05; base06 = style.b06; base07 = style.b07;
  base08 = style.b08; base09 = style.b09; base0A = style.b0A; base0B = style.b0B;
  base0C = style.b0C; base0D = style.b0D; base0E = style.b0E; base0F = style.b0F;
}

-- Load theme
base16(base16.themes["gruvbox-material-custom"], true)

return theme
