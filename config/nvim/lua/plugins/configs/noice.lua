local ok, noice = pcall(require, "noice")
if not ok then
  vim.notify("Couldn't load Noice " .. noice .. "\n")
end

noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    { -- delete search virtual text
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
  },
  -- cmdline = { view = "cmdline", },
  presets = {
    lsp_doc_border = true,
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
  },
})
