--
-- Initialize configuration
--
local ok, core = pcall(require, "core")

if ok then
  core.init()
else
  error("Couldn't run configuration " .. core .. "\n")
end
