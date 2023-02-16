--
-- All helper functions are here
--
local M = {}

-- Create global mapping
M.map = function(mode, key, func, opts)
  local options = opts or {}

  -- check if mode is a table or just a string
  if type(mode) == "table" then
    for _, m in ipairs(mode) do
      vim.keymap.set(m, key, func, options)
    end
  else
    vim.keymap.set(mode, key, func, options)
  end
end

-- Save current cursor position after running a command(cmd)
M.preserve = function(cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

-- Toggle spelling on buffer
M.toggleSpelling = function(option)
  local opts = { noremap = true, silent = true, buffer = 0 }

  -- using a vim buffer variable to store value of spell_toggle
  if vim.b.spell_toggle and option ~= "ft" then
    vim.cmd([[ setlocal nospell ]])
    vim.b.spell_toggle = false
    vim.notify("Spell OFF...")
    M.map("i", "<C-l>", "<Nop>", opts) -- delete instert mapping
  else
    if option == "es" then
      vim.cmd([[ setlocal spell spelllang=es ]])
      vim.notify("Spell ON: Español")
    else
      vim.cmd([[ setlocal spell spelllang=en_us ]])
      vim.notify("Spell ON: English")
    end
    vim.b.spell_toggle = true
    -- mapping for fix last spell error on insert mode
    M.map("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)
  end
end

return M
