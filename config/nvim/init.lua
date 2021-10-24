--
-- Initialize configuration
--
local ok, core = pcall(require, "core")

if ok then
  core.init('yes')
else
  vim.notify("Couldn't run configuration...")
end
