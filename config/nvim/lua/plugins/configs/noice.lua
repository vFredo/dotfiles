local ok, noice = pcall(require, "noice")
if not ok then
  vim.notify("Couldn't load Noice " .. noice .. "\n")
end

noice.setup({
  lsp = {
    signature = { auto_open = { enabled = false } },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  messages = { view_search = "mini" },
  routes = {
    { -- messages text like "written" on "mini" view
      filter = { event = "msg_show", find = "%d+L, %d+B" },
      view = "mini",
    },
    { -- indentation change message
      filter = { event = "msg_show", find = "%d+%s+lines%s+[><]ed%s+%d+%s+time" },
      opts = { skip = true }
    },
    {
      -- show macros 'recording @'
      filter = { event = "msg_showmode", find = "recording" },
      view = "mini",
    },
    { -- re-route long notifications to splits
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
