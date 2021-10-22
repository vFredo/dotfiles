--
-- Initialize configuration
--
local ok, _ = pcall(require, "core")

if not ok then
  print("Couldn't open the configuration")
end
