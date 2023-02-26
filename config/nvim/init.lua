--
-- Disable some built-in plugins we don't want
--
local disabled_builtins = {
  'tutor',
  '2html_plugin',
  'matchit',
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'loaded_vimball',
  'loaded_vimballPlugin',
  'loaded_netrw',
  'loaded_netrwPlugin',
  'loaded_netrwSettings',
  'loaded_netrwFileHandlers',
}

for _, plug in ipairs(disabled_builtins) do
  vim.g['loaded_' .. plug] = true
end

--
-- Initialize configuration
--
local modules = {
  'core.options',
  'plugins',
  'core.autocmds',
  'core.mappings',
  'core.theme',
  'core.highlights',
}

for _, module in ipairs(modules) do
  local ok, currMod = pcall(require, module)
  if not ok then
    vim.notify("Couldn't load module: " .. module .. "\n Error: " .. currMod)
  end
end
