local M = {}

M.blankline = function()
  require("indent_blankline").setup {
    -- show_current_context = true,
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

M.hexokinase = function()
  vim.g.Hexokinase_highlighters = { "virtual" }
  vim.g.Hexokinase_optInPatterns = { "full_hex", "rgb", "rgba", "hsl", "hsla" }
  vim.g.Hexokinase_ftEnabled = {
    'css',
    'sass',
    'html',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'typescript',
    'lua'
  }
end

M.neoscroll = function()
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

M.comment = function()
  require("nvim_comment").setup {
    comment_empty = false,
    hook = function()
      -- use treesitter to update the commentstring character
      local ts_comment = require("ts_context_commentstring.internal")
      ts_comment.update_commentstring()
    end
  }
end

return M
