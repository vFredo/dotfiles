local M = {  }

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      vim.cmd[[packadd packer.nvim]]
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

M.map = function(mode, lhs, rhs, opts)
  local options = opts or {  }

  -- check if mode is a table or just a string
  if type(mode) == "table" then
    for _, m in ipairs(mode) do
      vim.api.nvim_set_keymap(m, lhs, rhs, options)
    end
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

return M
