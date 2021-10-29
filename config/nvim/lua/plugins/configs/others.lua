local M = {  }

M.surround = function ()
  -- we have to do this since lightspeed takes 'S' binding on visual mode
  if packer_plugins["lightspeed"] then
    vim.cmd([[ xmap gs <Plug>VSurround ]])
  end
end

M.blankline = function()
  require("indent_blankline").setup {
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
      "lsp-installer"
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

M.hexokinase = function ()
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

M.neogit = function ()
  require("neogit").setup {
    disable_signs = true,
    disable_commit_confirmation = true,
    commit_popup = { kind = "vsplit" },
    integrations = { diffview = true } -- diffview plugin integration
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
end

M.navigator = function()
  require("Navigator").setup { auto_save = 'current' }
end

M.comment = function()
  require("nvim_comment").setup {
    comment_empty = false,
    hook = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")

      if  filetype == "c" or filetype == "cpp"  then
        vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
      elseif filetype == 'typescriptreact'
        or filetype == 'javascriptreact'
        or filetype == 'javascript'
        or filetype == 'css'
        or filetype == 'html'
      then
        local ts_comment = require("ts_context_commentstring.internal")
        ts_comment.update_commentstring()
      end
    end
  }
end

return M
