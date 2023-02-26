-- Helpers
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand groups
local gen_group = augroup("general_options", { clear = true })
local ft_group = augroup("filetype_specific", { clear = true })

-- Responsive panel/window size
autocmd({ "VimResized" }, {
  group = gen_group,
  callback = function() vim.cmd('tabdo wincmd =') end
})

-- Go to the last known location when openning a file
autocmd("BufReadPost", {
  group = gen_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if file changed when its window is focus, better than 'autoread'
autocmd("FocusGained",
  { group = gen_group, pattern = "*", command = "checktime" })

-- Format options
autocmd("FileType", {
  group = ft_group, pattern = "*",
  command = "set fo-=c fo-=r fo-=o fo+=j fo+=n"
})

-- Check spell on git commits
autocmd("FileType", {
  group = ft_group,
  pattern = { "gitcommit" },
  callback = function() require("core.utils").toggleSpelling('ft') end,
})

-- conceal level for latex and markdown files
autocmd("FileType", {
  group = ft_group, pattern = { "tex", "markdown" },
  callback = function() vim.opt.conceallevel = 2 end
})

-- Highlight yank text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})
