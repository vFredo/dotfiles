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

-- Trim extra spaces left in the file before save
autocmd("BufWritePre", {
  group = gen_group,
  pattern = { "*" },
  callback = function()
    require("core.utils").preserve('%s/\\s\\+$//ge')
  end,
})

-- Check if file changed when its window is focus, better than 'autoread'
autocmd("FocusGained", { group = gen_group, command = "checktime" })

-- Resize splits when window is resized
autocmd("VimResized", {
  group = gen_group,
  callback = function() vim.cmd("tabdo wincmd =") end
})

-- How automatic formatting is to be done
-- for format options see in ':h fo-table'
autocmd("FileType", { group = gen_group, command = "set formatoptions=tcqnj" })

-- Conceal level for filetypes
autocmd("FileType", {
  group = ft_group,
  pattern = { "org", "tex" },
  callback = function() vim.opt_local.conceallevel = 2 end
})

-- Check spell on git commits
autocmd("FileType", {
  group = ft_group,
  pattern = { "gitcommit" },
  callback = function() require("core.utils").toggleSpelling() end,
})

-- Highlight yank text
autocmd("TextYankPost", {
  group = yanking,
  callback = function()
    vim.hl.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = ft_group,
  pattern = {
    "alpha", "fugitive", "help",
    "lspinfo", "mason", "notify",
    "qf", "tsplayground", "checkhealth"
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
