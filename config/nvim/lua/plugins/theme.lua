local function delHash(hex)
  return hex:gsub("#", "")
end

local c = require("core.colors")

local style = {
  b00 = delHash(c.bg),     -- Default Background
  b01 = delHash(c.bgAlt),  -- Lighter bg (Used for statusbar, line number and folding)
  b02 = delHash(c.bgAlt2), -- Selection Background
  b03 = delHash(c.grey),   -- Comments, Invisibles, Line Highlighting
  b04 = delHash(c.fgAlt),  -- Dark Foreground (Used for status bars)
  b05 = delHash(c.fg),     -- Default Foreground, Caret, Delimiters, Operators
  b06 = delHash(c.fgAlt2), -- Light Foreground
  b07 = delHash(c.fg),     -- Light Background
  b08 = delHash(c.red),    -- Var, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  b09 = delHash(c.yellow), -- Ints, Bool, Constants, XML Attributes, Markup Link Url
  b0A = delHash(c.yellow), -- Classes, Markup Bold, Search Text Background
  b0B = delHash(c.green),  -- Strings, Inherited Class, Markup Code, Diff Inserted
  b0C = delHash(c.cyan),   -- Regular Expressions, Escape Characters, Markup Quotes
  b0D = delHash(c.blue),   -- Functions, Methods, Attribute IDs, Headings
  b0E = delHash(c.purple), -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  b0F = delHash(c.red)     -- Opening/Closing Embedded Language Tags
}

return {
  "norcalli/nvim-base16.lua",
  lazy = false,
  priority = 1000,
  dependencies = "norcalli/nvim.lua",
  config = function()
    local base16 = require("base16")

    base16.themes["gruvbox-material-custom"] = {
      base00 = style.b00, base01 = style.b01, base02 = style.b02, base03 = style.b03,
      base04 = style.b04, base05 = style.b05, base06 = style.b06, base07 = style.b07,
      base08 = style.b08, base09 = style.b09, base0A = style.b0A, base0B = style.b0B,
      base0C = style.b0C, base0D = style.b0D, base0E = style.b0E, base0F = style.b0F,
    }
    -- Load theme
    base16(base16.themes["gruvbox-material-custom"], true)
  end
}
