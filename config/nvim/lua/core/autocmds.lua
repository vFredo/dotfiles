-- Helpers
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand groups
local gen_group = augroup("general_options", { clear = true })
local ft_group = augroup("filetype_specific", { clear = true })
local yanking = augroup("yank_text", { clear = true })

--
-- Autocommands
--

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
autocmd("FocusGained", { group = gen_group, command = "checktime" })

-- Resize splits when window is resized
autocmd("VimResized", {
  group = gen_group,
  callback = function() vim.cmd("tabdo wincmd =") end
})

-- Format options see in help 'fo-table'
autocmd("BufEnter", {
  group = gen_group,
  command = "setlocal fo-=c fo-=r fo-=o fo+=j fo+=n"
})

-- Check spell on git commits
autocmd("FileType", {
  group = ft_group,
  pattern = { "gitcommit" },
  callback = function() require("core.utils").toggleSpelling('ft') end,
})

-- conceal level for latex
autocmd("FileType", {
  group = ft_group,
  pattern = { "tex" },
  callback = function() vim.opt.conceallevel = 2 end
})

-- Highlight yank text
autocmd("TextYankPost", {
  group = yanking,
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = ft_group,
  pattern = {
    "alpha", "fugitive", "help",
    "lspinfo", "mason", "notify",
    "qf", "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Open nvim-tree automatically when open a folder as first file
autocmd("VimEnter", {
  group = gen_group,
  callback = function(event)
    if vim.fn.isdirectory(event.file) == 1 then
      vim.cmd.cd(event.file)
      require("nvim-tree.api").tree.open()
      return
    end
  end
})
