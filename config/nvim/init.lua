--
-- Setting up lua config files in a async way
--
require "core.options"

local async
async =
  vim.loop.new_async(
    vim.schedule_wrap(
      function ()
        require "plugins"
        require "core.utils".packer_lazy_load()
        require "core.mappings"
        require "core.theme"
        require "core.highlights"
        async:close()
      end
    )
  )
async:send()
