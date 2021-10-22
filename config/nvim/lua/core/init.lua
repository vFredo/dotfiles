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
        -- require "core.utils".packer_lazy_load(80)
        require "core.mappings"
        require "core.theme"
        require "core.highlights"
        require "core.autocmds"
        async:close()
      end
    )
  )
async:send()
