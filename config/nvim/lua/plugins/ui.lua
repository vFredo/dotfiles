return {
  {
    -- Indentation guides/tracking
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
      char = "▏",
      use_treesitter = true,
      buftype_exclude = { "terminal" },
      filetype_exclude = {
        "help", "terminal", "lspinfo",
        "mason", "lazy", "TelescopePrompt",
        "TelescopeResults", "noice"
      },
    }
  },
  {
    -- Smooth scrolling
    "karb94/neoscroll.nvim",
    keys = {
      '<C-u>', '<C-d>', '<C-b>', '<C-f>',
      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
    },
    config = function()
      require("neoscroll").setup {
        respect_scroll_off = true,
        hide_curor = true,
        stop_eof = true,
        cursor_scrolls_alone = false,
        easing_function = "circular"
      }
      -- Syntax: map[keys] = {function, {function arguments}}
      local map    = {}
      map['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
      map['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
      map['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '100' } }
      map['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '100' } }
      map['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
      map['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
      map['zt']    = { 'zt', { '150' } }
      map['zz']    = { 'zz', { '150' } }
      map['zb']    = { 'zb', { '150' } }
      require("neoscroll.config").set_mappings(map)
    end
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
}
