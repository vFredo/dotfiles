--
-- Setting up lua config files
--
local M = {  }

M.disable_default_plugins = function()
  local g = vim.g
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  g.loaded_matchit = 1
  -- g.loaded_matchparen = 1
  g.loaded_2html_plugin = 1
  g.loaded_logiPat = 1
  g.loaded_rrhelper = 1
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_netrwFileHandlers = 1
end

M.init = function()
  M.disable_default_plugins()
  local modules = {
    "core.options",
    "plugins",
    "core.autocmds",
    "core.theme",
    "core.highlights",
    "core.mappings",
  }

  for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

return M
