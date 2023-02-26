local ok, blankline = pcall(require, "indent_blankline")
if not ok then
  vim.notify("Couldn't load indent_blankline " .. blankline .. "\n")
end

blankline.setup {
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  char = "▏",
  use_treesitter = true,
  buftype_exclude = { "terminal" },
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "mason",
    "lazy",
    "TelescopePrompt",
    "TelescopeResults",
  },
}
