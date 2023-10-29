-- Helpers
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand groups
local gen_group = augroup("general_options", { clear = true })
local ft_group = augroup("filetype_specific", { clear = true })
local yanking = augroup("yank_text", { clear = true })
local lsp_group = augroup('UserLspConfig', {})

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
  callback = function() require("core.utils").toggleSpelling('ft') end,
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

-- Lsp buffer bindigns
autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    -- Enable completion default trigger by <c-x><c-o>
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mappings
    local opts = { noremap = true, buffer = event.buf, silent = true }
    local desc = require("core.utils").desc

    vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", desc(opts, "[g]o [d]efinitions"))
    vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", desc(opts, "[g]o [r]eferences"))
    vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", desc(opts, "[g]o [i]mplementations"))
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, desc(opts, "[g]o [a]ction in code"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, desc(opts, "Previous [d]iagnostic"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, desc(opts, "Next [d]iagnostic"))
    vim.keymap.set('n', '<Leader>fd', "<cmd>Telescope diagnostics<cr>", desc(opts, "[f]ind [d]iagnostic"))
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, desc(opts, "[r]e[n]ame in current position"))
    vim.keymap.set('n', '<Leader>F', function() vim.lsp.buf.format { async = true } end, desc(opts, "[F]ormat document"))
  end
})
