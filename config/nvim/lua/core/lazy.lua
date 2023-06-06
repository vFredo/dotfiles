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
    ui = { border = "rounded" },
    performance = {
      rtp = {
        paths = { vim.fn.stdpath("data") .. "/site" },
        disabled_plugins = {
          'gzip',
          'tohtml',
          'matchit',
          'rplugin',
          'tarPlugin',
          'zipPlugin',
          'netrwPlugin',
          'tutor',
        },
      }
    }
  }
)
