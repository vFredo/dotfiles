--
-- Setting up lua config files in a async way
--
local M = {  }

M.init = function()
  local modules = {
    "core.options",
    "plugins",
    "core.autocmds",
    "core.theme",
    "core.highlights",
    "core.mappings",
  }

  for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

return M
