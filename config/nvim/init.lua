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

        require "mappings"

        require "theme"
        require "highlights"

        require("impatient").enable_profile()
        async:close()
      end
    )
  )
async:send()
