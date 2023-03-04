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
