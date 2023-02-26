--
-- Disable some built-in plugins we don't want
--
local disabled_built_ins = {
  'tutor_mode_plugin',
  'gzip',
  'zipPlugin',
  'zip',
  'tarPlugin',
  'tar',
  'matchit',
  'shada_plugin',
  'netrwPlugin',
  'netrwSettings',
}

for _, plug in ipairs(disabled_built_ins) do
  vim.g['loaded_' .. plug] = 1
end

--
-- Initialize configuration
--
local modules = {
  "core.options",
  "plugins",
  "core.autocmds",
  "core.mappings",
  "core.theme",
  "core.highlights",
}

for _, module in ipairs(modules) do
  local ok, currMod = pcall(require, module)
  if not ok then
    vim.notify("Couldn't load module: " .. module .. "\n Error: " .. currMod)
  end
end
