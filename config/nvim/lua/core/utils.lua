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

  -- which plugins are we lazy loading
  local plugins = "surround.nvim gitsigns.nvim neogit nvim-tree.lua"

  vim.defer_fn(function()
    packer.loader(plugins)
  end, timer)
end

-- General mappings
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

-- Buffer specific mappings
M.buf_map = function (bufnr, ...)
  -- if bufnr == 0 this means make the map on the current buffer
  vim.api.nvim_buf_set_keymap(bufnr, ...)
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

-- Helper function for commands
M.preserve = function (cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

-- Toggle spelling on buffer
M.toggleSpelling = function (option)

  local opts = { noremap = true, silent = true }

  if vim.b.spell_toggle and option ~= "ft" then
    vim.cmd([[ setlocal nospell ]])
    vim.b.spell_toggle = false
    vim.notify("Spell OFF...")
    M.buf_map(0, "i", "<C-l>", "<Nop>", opts) -- delete spell mapping
    return
  end

  if option ~= "ft" then
    vim.b.spell_toggle = true
  end

  if option == "es" then
    vim.cmd([[ setlocal spell spelllang=es ]])
    vim.notify("Spell ON: Spanish...")
  else
    vim.cmd([[ setlocal spell spelllang=en_us ]])
    vim.notify("Spell ON: English...")
  end

  -- Easy mapping for fix last spell error
  M.buf_map(0, "i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)
end

return M
