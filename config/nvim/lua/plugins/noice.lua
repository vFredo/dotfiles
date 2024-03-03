return {
  {
    -- Improve default notifications
    "rcarriga/nvim-notify",
    opts = {
      timeout = 4000,
      stages = "fade_in_slide_out",
      render = "wrapped-compact",
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
      popupmenu = { backend = 'nui' },
      cmdline = {
        format = {
          substitute = { pattern = '^:[%%]*s/', icon = ' ', ft = 'regex', title = '' },
          input = { icon = ' ', lang = 'text', view = 'cmdline_popup', title = '' },
        },
      },
      lsp = {
        signature = { auto_open = { enabled = false } },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        documentation = {
          opts = {
            win_options = {
              conceallevel = 2,
              concealcursor = "n",
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "helpVim",
              },
            },
          },
        },
      },
      messages = { view_search = "mini" },
      routes = {
        { filter = {
            event = "msg_show",
            any = {
              { find = "%s+[><]ed%s" }, -- visual indentation
              { find = "search hit BOTTOM" },
              { find = "search hit TOP" },
              { find = '^Hunk %d+ of %d'  } -- gitsign hunk message
            }
        }, skip = true },
        -- messages text like "written" on mini view
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
        -- LSP annoying messages
        { filter = { event = "notify", find = "No information available" }, skip = true },
        { filter = { find = "No signature help" }, skip = true },
      },
      presets = {
        lsp_doc_border = true,
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true
      },
    }
  },
}
