--
-- Initialize configuration
--
local modules = {
  'core.options',
  'core.lazy',
  'core.autocmds',
  'core.mappings',
  'core.highlights',
}

for _, module in ipairs(modules) do
  local ok, currMod = pcall(require, module)
  if not ok then
    vim.notify("Couldn't load module: " .. module .. "\n Error: " .. currMod)
  end
end
