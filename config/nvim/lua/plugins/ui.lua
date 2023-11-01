return {
  {
    -- Icons for patch fonts
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      override = {
        [""] = { icon = "", color = "#d5c4a1", name = "", },
        ["robots.txt"] = { icon = "ﮧ", color = "#ea6962", name = "robots", },
        ["out"] = { icon = "", color = "#ea6962", name = "out", },
        ["in"] = { icon = "", color = "#a9b665", name = "in", },
        Dockerfile = { icon = " ", color = "#7daea3", name = "Dockerfile" },
        ttf = { icon = "", name = "TrueTypeFont", },
        woff = { icon = "", name = "WebOpenFontFormat", },
        woff2 = { icon = "", name = "WebOpenFontFormat2", },
        mp3 = { icon = "", name = "mp3", },
        mp4 = { icon = "", name = "mp4", },
        norg = { icon = "◉", color = "#4878be", name = "neorg" }
      }
    }
  },
  {
    -- Indentation guides/tracking
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { char = "▏" },
      exclude = {
        filetypes = {
          "help", "terminal", "lspinfo",
          "mason", "lazy", "TelescopePrompt",
          "TelescopeResults", "noice"
        },
        buftypes = { "terminal " }
      }
    }
  },
  {
    -- Smooth scrolling
    "karb94/neoscroll.nvim",
    keys = {
      '<C-u>', '<C-d>', '<C-b>', '<C-f>',
      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
    },
    opts = {
      respect_scroll_off = true,
      hide_curor = true,
      stop_eof = true,
      cursor_scrolls_alone = false,
      easing_function = "quintic"
    }
  },
  {
    -- Color highlighter for hex, rgb, etc...
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
        mode = "virtualtext",
        virtualtext = "■"
      }
    }
  },
  {
    -- show key combinations menu if to slow with their description
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function() vim.o.timeout = true end,
    config = true
  },
  {
    -- working with directories in buffers
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "-", "<cmd>Oil<cr>", desc = "Open tree directory view" } },
    opts = {
      view_options = { show_hidden = true },
      keymaps = { ["q"] = "actions.close" }
    }
  }
}
