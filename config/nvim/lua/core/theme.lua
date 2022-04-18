local base16 = require("base16")
local theme = {  }

theme.colors = {
  bg = "#1d2021",
  fg = "#d5c4a1",
  red = "#ea6962",
  green = "#a9b665",
  yellow = "#ffc745",
  blue = "#7daea3",
  magenta = "#93869b",
  purple = "#C586C0",
  cyan = "#89b482",
  grey = "#665c54",
  orange = "#dc9656",
  orangeAlt = "#d65d0e",
  pink = "#d3869b",

  -- Alternative colors
  bgAlt = "#282828",
  bgAlt2 = "#32302f",
  fgAlt = "#bdae93",
  fgAlt2 = "#ebdbb2",
}

local function stripHash (hex)
  return hex:gsub("#", "")
end

local c = theme.colors

local b_theme = {
  b00 = stripHash(c.bg), -- Default Background
  b01 = stripHash(c.bgAlt), -- Lighter bg (Used for statusbar, line number and folding)
  b02 = stripHash(c.bgAlt2), -- Selection Background
  b03 = stripHash(c.grey), -- Comments, Invisibles, Line Highlighting
  b04 = stripHash(c.fgAlt), -- Dark Foreground (Used for status bars)
  b05 = stripHash(c.fg), -- Default Foreground, Caret, Delimiters, Operators
  b06 = stripHash(c.fgAlt2), -- Light Foreground
  b07 = stripHash(c.fg), -- Light Background
  b08 = stripHash(c.red), -- Var, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  b09 = stripHash(c.yellow), -- Ints, Bool, Constants, XML Attributes, Markup Link Url
  b0A = stripHash(c.orange), -- Classes, Markup Bold, Search Text Background
  b0B = stripHash(c.green), -- Strings, Inherited Class, Markup Code, Diff Inserted
  b0C = stripHash(c.blue), --  Regular Expressions, Escape Characters, Markup Quotes
  b0D = stripHash(c.pink), -- Functions, Methods, Attribute IDs, Headings
  b0E = stripHash(c.cyan), -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  b0F = stripHash(c.orangeAlt) -- Opening/Closing Embedded Language Tags
}

-- Set base16 neovim theme
base16.themes["neodots"] = {
  base00 = b_theme.b00; base01 = b_theme.b01; base02 = b_theme.b02; base03 = b_theme.b03;
  base04 = b_theme.b04; base05 = b_theme.b05; base06 = b_theme.b06; base07 = b_theme.b07;
  base08 = b_theme.b08; base09 = b_theme.b09; base0A = b_theme.b0A; base0B = b_theme.b0B;
  base0C = b_theme.b0C; base0D = b_theme.b0D; base0E = b_theme.b0E; base0F = b_theme.b0F;
}

base16(base16.themes["neodots"], true)
return theme
