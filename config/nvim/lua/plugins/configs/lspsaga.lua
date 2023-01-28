local lspsaga = require("lspsaga")
local colors = require("core.theme").colors

lspsaga.setup {
  symbol_in_winbar = { enable = false, },
  lightbulb = { enable = false },
  ui = {
    code_action = " ",
    diagnostic =  " ",
    border = "rounded",
    colors = {
      normal_bg = colors.bgAlt2,
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
