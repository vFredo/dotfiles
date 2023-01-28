-- Helpers
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand groups
local gen_group = augroup("general_options", { clear = true })
local ft_group = augroup("filetype_specific", { clear = true })

-- Responsive panel/window size
autocmd({ "VimResized" },
  { group = gen_group, pattern = "*", command = "wincmd =" })

-- Open a file from its last left off position
autocmd("BufReadPost", {
  group = gen_group,
  callback = function()
    if not vim.fn.expand("%:p"):match ".git" and vim.fn.line "'\"" > 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.cmd "normal! g'\""
      vim.cmd "normal zz"
    end
  end,
})

-- Check if file changed when its window is focus, better than 'autoread'
autocmd("FocusGained",
  { group = gen_group, pattern = "*", command = "checktime" })

-- Format options
autocmd("FileType",
  { group = ft_group, pattern = "*", command = "set fo-=c fo-=r fo-=o fo+=j fo+=n" })

-- Check spell on git commits
autocmd("FileType", {
  group = ft_group,
  pattern = "gitcommit",
  command = "lua require('core.utils').toggleSpelling('ft')"
})

-- Highlight yank text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})
