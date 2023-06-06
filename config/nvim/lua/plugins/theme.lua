return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local colors = require("core.colors")
    require("gruvbox").setup({
      contrast = "hard",
      palette_overrides = {
        light0_hard = colors.fg,
        light0 = colors.fg,
        light1 = colors.fg,
        light2 = colors.fgAlt2,
        light3 = colors.fgAlt,
        dark1 = colors.bgAlt,
        dark2 = colors.bgAlt2,
        bright_red = colors.red,
        bright_yellow = colors.yellow,
        bright_blue = colors.blue,
        bright_green = colors.green,
        bright_orange = colors.orange,
        gray = colors.grey,
      }
    })
    vim.cmd.colorscheme('gruvbox')
  end
}
