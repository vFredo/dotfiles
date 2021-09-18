--
-- Making sure that packer is Install
--
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

--
-- Lua setting up config files
--
require "options"

local async
async =
  vim.loop.new_async(
    vim.schedule_wrap(
      function ()
        require "plugins.init"
        require "plugins.configs.bufferline"

        require "mappings"

        require "theme"
        require "highlights"
        async:close()
      end
    )
)
async:send()
