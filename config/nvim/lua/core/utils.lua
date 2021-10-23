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

M.buf_map = function (bufnr, ...)
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

_G.Spell_on = false

-- Toggle spelling on buffer
M.toggleSpelling = function (option)

  if Spell_on and option ~= "ft" then
    vim.cmd[[setlocal nospell]]
    M.map("i", "<C-l>", "<Nop>", {noremap = true, silent = true})
    Spell_on = false
    print("Spell OFF")
    return
  end

  if option ~= "ft" then
    Spell_on = true
  end

  if option == "es" then
    vim.cmd[[setlocal spell spelllang=es]]
    print("Spell ON: Spanish...")
  else
    vim.cmd[[setlocal spell spelllang=en_us]]
    print("Spell ON: English...")
  end

  -- Easy mapping for fix last spell error
  M.buf_map(0, "i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", {noremap = true, silent = true})
end

return M
