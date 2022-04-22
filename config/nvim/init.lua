
--
-- Disable some default nvim plugins
--
local g = vim.g
g.loaded_gzip = 1
g.loaded_rrhelper = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_2html_plugin = 1
g.loaded_vimballPlugin = 1
g.loaded_getscriptPlugin = 1
g.loaded_logipat = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1
-- g.loaded_netrwFileHandlers = 1
-- g.loaded_netrw = 1
-- g.loaded_tar = 1
-- g.loaded_zip = 1
-- g.loaded_getscript = 1
-- g.loaded_vimball = 1
-- g.loaded_matchparen = 1

--
-- Initialize configuration
--
local modules = {
  "core.options",
  "plugins",
  "impatient",
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

  if module == 'impatient' then
    err.enable_profile()
  end
end
