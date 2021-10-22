--
-- All helper functions are here
--
local M = {  }

-- Load plugin after entering vim ui
-- With a little changes https://github.com/NvChad/NvChad/blob/main/lua/core/utils.lua
M.packer_lazy_load = function(timer)
  timer = timer or 0

  vim.cmd "packadd packer.nvim"
  local present, packer = pcall(require, "packer")
  if not present then
    return
  end

  local plugins = "surround.nvim gitsigns.nvim neogit nvim-lspconfig nvim-tree.lua"
  vim.defer_fn(function()
    packer.loader(plugins)
  end, timer)
end

-- Mappings
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

-- Autocommands groups
-- This function is taken from https://github.com/norcalli/nvim_utils
M.create_autocommands = function (definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

return M
