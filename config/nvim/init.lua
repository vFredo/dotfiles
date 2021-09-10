require "options"

local async
async =
  vim.loop.new_async(
    vim.schedule_wrap(
      function ()
        require "plugins"
        require "theme"
        require "mappings"
        require "plugins.bufferline"
        async:close()
      end
    )
)
async:send()
