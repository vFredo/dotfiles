-- Helpers
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand groups
local gen_group = augroup("general_options", { clear = true })
local ft_group = augroup("filetype_specific", { clear = true })
local yank_group = augroup("highlight_yank", { clear = true })

-- Responsive panel/window size
autocmd({ "VimResized" },
  { group = gen_group, pattern = "*", command = "wincmd =" })

-- Restore cursor position
autocmd({ "BufRead" },
  { group = gen_group, pattern = "*", command = [[call setpos(".", getpos("'\""))]] })

-- Check if file changed when its window is focus, better than 'autoread'
autocmd({ "FocusGained" },
  { group = gen_group, pattern = "*", command = "checktime" })

-- Format options
autocmd({ "FileType" },
  { group = ft_group, pattern = "*", command = "set fo-=c fo-=r fo-=o fo+=j fo+=n" })

-- Check spell on git commits
autocmd({ "FileType" }, {
  group = ft_group,
  pattern = "gitcommit",
  command = "lua require('core.utils').toggleSpelling('ft')"
})

-- Highlight yank text
autocmd({ "TextYankPost" }, {
  group = yank_group,
  pattern = "*",
  command = [[silent! lua vim.highlight.on_yank() { higroup="IncSearch", timeout=500 }]]
})
