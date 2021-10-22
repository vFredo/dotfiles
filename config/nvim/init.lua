--
-- Initialize configuration
--
local ok, core = pcall(require, "core")

if ok then
  core.init()
else
  print("Couldn't log configuration")
end
