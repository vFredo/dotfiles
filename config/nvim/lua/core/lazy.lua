--
-- Check if lazy is installed, if not cloned it from github
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--
-- Lazy configuration
--
return require('lazy').setup(
  'plugins',
  {
    ui = {
      icons = {
        ft = "",
        lazy = "󰂠 ",
        loaded = "",
        not_loaded = "",
      },
      border = "rounded"
    },
    performance = {
      rtp = {
        paths = { vim.fn.stdpath("data") .. "/site" },
        disabled_plugins = {
          'zip',
          'gzip',
          'zipPlugin',
          'tar',
          'tarPlugin',
          'tohtml',
          'matchit',
          'tutor',
          'vimball',
          'vimballPlugin',
          'rplugin',
          'optwin',
          'netrw',
          'netrwPlugin',
          'netrwSettings',
          'netrwFileHandlers',
          '2html_plugin'
        },
      }
    }
  }
)
