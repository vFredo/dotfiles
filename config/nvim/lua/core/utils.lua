--
-- All helper functions are here
--
local M = {  }

-- Create global mapping
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

-- Key mapping to a specific buffer
M.buf_map = function (bufnr, ...)
  -- if bufnr == 0 this means make the map on the current buffer
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

-- Create Autocommand groups
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

-- Save current cursor position after running a command(cmd)
M.preserve = function (cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

-- Toggle spelling on buffer
M.toggleSpelling = function (option)

  local opts = { noremap = true, silent = true }

  -- using a vim buffer variable to store value of spell_toggle
  if vim.b.spell_toggle and option ~= "ft" then
    vim.cmd([[ setlocal nospell ]])
    vim.b.spell_toggle = false
    vim.notify("Spell OFF...")
    M.buf_map(0, "i", "<C-l>", "<Nop>", opts) -- delete instert mapping
  else
    if option == "es" then
      vim.cmd([[ setlocal spell spelllang=es ]])
      vim.notify("Spell ON: Spanish...")
    else
      vim.cmd([[ setlocal spell spelllang=en_us ]])
      vim.notify("Spell ON: English...")
    end
    vim.b.spell_toggle = true
    -- mapping for fix last spell error on insert mode
    M.buf_map(0, "i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)
  end
end

return M
