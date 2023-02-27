--
-- Disable some built-in plugins we don't want
--
local disabled_builtins = {
  'tutor',
  '2html_plugin',
  'gzip',
  'matchit',
  'tohtml',
  'zipPlugin',
  'tarPlugin',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

for _, plug in ipairs(disabled_builtins) do
  vim.g['loaded_' .. plug] = 1
end

--
-- Initialize configuration
--
local modules = {
  'core.options',
  'plugins',
  'core.autocmds',
  'core.highlights',
  'core.mappings',
}

for _, module in ipairs(modules) do
  local ok, currMod = pcall(require, module)
  if not ok then
    vim.notify("Couldn't load module: " .. module .. "\n Error: " .. currMod)
  end
end
