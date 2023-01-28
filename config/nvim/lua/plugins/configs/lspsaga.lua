local lspsaga = require("lspsaga")
local colors = require("core.theme").colors

lspsaga.setup {
  symbol_in_winbar = { enable = false, },
  lightbulb = { enable = false },
  ui = {
    code_action = "",
    diagnostic =  " ",
    -- Border type can be single, double, rounded, solid, shadow.
    border = "rounded",
    colors = {
      -- Normal background color for floating window
      normal_bg = colors.bgAlt2,
      -- Title background color
      title_bg = colors.bgAlt,
      red = colors.red,
      magenta = colors.magenta,
      orange = colors.orange,
      yellow = colors.yellow,
      green = colors.green,
      cyan = colors.cyan,
      blue = colors.blue,
      purple = colors.purple,
      white = colors.fg,
      black = colors.bg,
    },
  }
}
