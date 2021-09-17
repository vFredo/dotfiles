-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/fredo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/fredo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/fredo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/fredo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/fredo/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.statusline\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.blankline\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  loupe = {
    config = { "\27LJ\1\0024\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0\23LoupeCenterResults\6g\bvim\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/loupe"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins.cmp\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.lspconfig\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim.lua"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/nvim.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    config = { "\27LJ\1\2T\0\0\2\0\6\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\3\0%\1\5\0:\1\4\0G\0\1\0\nabdmg\16tex_conceal\6g\17conceallevel\bopt\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/opt/tex-conceal.vim"
  },
  ultisnips = {
    config = { "\27LJ\1\2È\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\3\0%\1\5\0:\1\4\0004\0\0\0007\0\3\0'\1\0\0:\1\6\0G\0\1\0&UltiSnipsRemoveSelectModeMappings\rvertical\23UltiSnipsEditSplit\6gI let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/vimSnips'] \bcmd\bvim\0" },
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimtex = {
    config = { "\27LJ\1\2‰\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0'\1\2\0:\1\6\0G\0\1\0 vimtex_vimtex_quickfix_mode\fzathura\23vimtex_view_method\nlatex\15tex_flavor\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16plugins.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: loupe
time([[Config for loupe]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0\23LoupeCenterResults\6g\bvim\0", "config", "loupe")
time([[Config for loupe]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23plugins.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\1\2È\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\3\0%\1\5\0:\1\4\0004\0\0\0007\0\3\0'\1\0\0:\1\6\0G\0\1\0&UltiSnipsRemoveSelectModeMappings\rvertical\23UltiSnipsEditSplit\6gI let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/vim/vimSnips'] \bcmd\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22plugins.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex', 'tex-conceal.vim'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/fredo/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
