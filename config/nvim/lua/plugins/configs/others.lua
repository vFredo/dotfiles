local M = {  }

M.lightspeed = function ()
  require("lightspeed").setup {
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = true,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5,
    x_mode_prefix_key = '<c-x>',
    substitute_chars = { ['\r'] = '¬' },
    instant_repeat_fwd_key = ';',
    instant_repeat_bwd_key = ',',
    -- If no values are given, these will be set at runtime,
    -- based on `jump_to_first_match`.
    labels = nil,
    cycle_group_bwd_key = '[',
    cycle_group_fwd_key = ']',
  }
  -- Allows using macros with 'f/F' and 't/T' with the normal behavior
  vim.cmd([[
    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
  ]])
end

M.surround = function ()
  -- we have to do this since lightspeed takes 'S' binding on visual mode
  if packer_plugins["lightspeed.vim"] then
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

M.colorizer = function()
  require("colorizer").setup({
    "*"; -- Highlight all files with defautls, but customize some others.
    "!NeogiStatus"; -- exclude filetype
    "!NeogitCommitMessage";
    css = { rgb_fn = true, names = true }; -- CSS rgb() and rgba() + defaults
  },{ -- defaults
      names = false,   -- "Name" codes like 'Blue'
      RGB = false,     -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      mode = 'background', -- Set the display mode.
    })
  vim.cmd "ColorizerReloadAllBuffers"
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
