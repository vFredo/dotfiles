local ok, noice = pcall(require, "noice")
if not ok then
  vim.notify("Couldn't load Noice " .. noice .. "\n")
end

noice.setup({
  lsp = {
    signature = { auto_open = { enabled= false } },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      -- serarch virtual text on "mini" view
      filter = { event = "msg_show", kind = "search_count" },
      view = "mini"
    },
    {
      -- messages text like "written" on "mini" view
      filter = { event = "msg_show", find = "%d+L, %d+B" },
      view = "mini",
    },
    {
      -- show macros 'recording @' and current mode
      filter = { event = "msg_showmode" },
      view = "mini",
    },
    {
      -- reroute long notifications to splits
      filter = { event = "notify", min_height = 15 },
      view = 'split'
    }
  },
  presets = {
    lsp_doc_border = true,
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
})
