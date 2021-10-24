--
-- Setting up lua config files in a async way
--
local M = {  }

M.load_modules = function ()
  local modules = {
    "plugins",
    "core.autocmds",
    "core.mappings",
    "core.theme",
    "core.highlights",
  }

  for _, module in ipairs(modules) do
    local ok, err = pcall(require, module)
    if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
    end
  end
end

M.init = function(opt)
  local is_async = opt or 'yes'
  require "core.options"

  if is_async == 'yes' then
    local async
    async =
      vim.loop.new_async(
        vim.schedule_wrap(
          function ()
            M.load_modules()
            async:close()
          end
        )
      )
    async:send()
  else
    M.load_modules()
  end
  require "core.utils".packer_lazy_load(80)
end

return M
