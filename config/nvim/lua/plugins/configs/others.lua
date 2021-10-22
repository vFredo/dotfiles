local M = {  }

local function verify(module)
  local ok, plugin = pcall(require, module)
  if not ok then
    return nil
  end
  return plugin
end

M.colorizer = function ()
  local colorizer = verify("colorizer")
  if colorizer == nil then
    return
  end
  colorizer.setup({"*"}, {
    names = false,   -- "Name" codes like 'Blue'
    RRGGBB = true,   -- #RRGGBB hex codes
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true,   -- CSS rgb() and rgba() functions
  })
  vim.cmd "ColorizerReloadAllBuffers"
end

M.neogit = function ()
  local neogit = verify("neogit")
  if neogit == nil then
    return
  end
  neogit.setup {
    disable_signs = true,
    disable_commit_confirmation = true
  }
end

M.neoscroll = function()
  local neoscroll = verify("neoscroll")
  if neoscroll == nil then
    return
  end
  neoscroll.setup {
    use_local_scrolloff = true,
    easing_function = "circular"
  }
end

M.navigator = function()
  local navigator = verify("Navigator")
  if navigator == nil then
    return
  end
  navigator.setup { auto_save = 'current' }
end

M.surround = function()
  local surround = verify("surround")
  if surround == nil then
    return
  end
  surround.setup {
    mappings_style = "sandwich",
    map_insert_mode = false
  }
end

M.comment = function()
  local comment = verify("nvim_comment")
  if comment == nil then
    return
  end
  comment.setup {
    hook = function()
      local ts_comment = require("ts_context_commentstring.internal")
      ts_comment.update_commentstring()
    end,
    comment_empty = false
  }
end

return M
