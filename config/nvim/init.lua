--
-- Setting up lua config files in a async way
--
require "options"

local async
async =
  vim.loop.new_async(
    vim.schedule_wrap(
      function ()
        require "plugins"
        require "highlights"
        require "theme"
        require "mappings"
        async:close()
      end
    )
  )
async:send()
