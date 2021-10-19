--
-- Making sure that packer is install
--
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

--
-- Setting up lua config files
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
