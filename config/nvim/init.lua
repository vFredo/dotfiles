--
-- Initialize configuration
--
local ok, core = pcall(require, "core")

if ok then
  core.init()
else
  vim.notify("Couldn't run configuration...")
end
