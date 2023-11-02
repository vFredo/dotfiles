--
-- All helper functions are here
--
local M = {}

-- Add a description attribute to a table
M.desc = function(opts, description)
  return vim.tbl_extend("force", opts, { desc = description })
end

-- Save current cursor position after running a command(cmd)
M.preserve = function(cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

-- Toggle spelling on buffer
M.toggleSpelling = function(language)
  local opts = { noremap = true, silent = true, buffer = 0 }

  if vim.b.spell_active then
    vim.cmd([[ setlocal nospell ]])
    vim.b.spell_active = false
    vim.notify("Spell OFF...")

    -- Remove the insert mode mapping for spell correction
    vim.keymap.set("i", "<C-l>", "<Nop>", opts)
  else
    -- Set the default language to English, if no specific language is provided
    language = language or "en_us"

    -- Turn on spell checking with the specified language
    vim.cmd("setlocal spell spelllang=" .. language)
    vim.notify("Spell ON: " .. string.upper(language))
    vim.b.spell_active = true

    -- Mapping for fixing the last spell error in insert mode
    vim.keymap.set("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)
  end
end

return M
