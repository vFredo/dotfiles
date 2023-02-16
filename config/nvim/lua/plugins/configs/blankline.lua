  require("indent_blankline").setup {
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    char = "▏",
    buftype_exclude = { "terminal" },
    filetype_exclude = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "mason",
      "TelescopePrompt",
      "TelescopeResults",
    },
  }
