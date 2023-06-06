return {
  {
    -- Improve default notifications
    "rcarriga/nvim-notify",
    event = "BufEnter",
    opts = {
      fps = 60,
      stages = "slide",
      timeout = 2500,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      },
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    }
  },
  {
    -- Improve the default vim.ui, cmdline and search interfaces
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
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
        {
          -- messages text like "written" on mini view
          filter = { event = "msg_show", find = "%d+L, %d+B" },
          view = "mini",
        },
        {
          -- show recording macros 'recording @' on mini view
          filter = { event = "msg_showmode", find = "recording" },
          view = "mini",
        },
        {
          -- delete visual indentation message
          filter = { event = "msg_show", find = "%s+[><]ed%s" },
          opts = { skip = true }
        },
        {
          -- LSP annoying message
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true }
        },
      },
      presets = {
        lsp_doc_border = true,
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    }
  },
}
