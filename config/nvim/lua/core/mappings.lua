local map = require("core.utils").map
local opt = { noremap = true, silent = true }

-- Yank and paste text from clipboard
map({ "n", "v" }, "<Leader>y", [["+y]], opt)
map({ "n", "v" }, "<Leader>p", [["+p]], opt)

-- use ESC in normal mode to turn off search highlighting
map("n", "<Esc>", ":nohlsearch<CR>", opt)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers ignore_current_buffer=true<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep additional_args=--hidden<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)

-- nvim-tree
map("n", "<Leader>t", ":NvimTreeToggle<CR>", opt)

-- Neogit
map("n", "<Leader>g", ":Neogit<CR>", opt)

-- Consistent movement
map({ "n", "v" }, "gh", "^", opt)
map({ "n", "v" }, "gl", "$", opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k', also
-- don't use g[j|k] when in operator pending mode, so it doesn't alter 'd', 'y' or 'c'
-- empty mode is same as using :map
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Buffers
map("n", "<Leader>d", ":Sayonara<CR>", opt)
map("n", "<Leader>l", ":bnext<CR>", opt)
map("n", "<Leader>h", ":bprevious<CR>", opt)
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L",opt)
map("n", "<Leader>H", "<C-w>H",opt)
map({ "n", "v" }, "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opt)
map({ "n", "v" }, "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opt)
map({ "n", "v" }, "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opt)
map({ "n", "v" }, "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opt)

-- Easy edits
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map({ "n", "x" }, "Y", "y$", opt)

-- Jump quickfix list
map("n", "<Up>", ":cprevious<CR>", opt)
map("n", "<Down>", ":cnext<CR>", opt)
map("n", "<Left>", ":cpfile<CR>", opt)
map("n", "<Right>", ":cnfile<CR>", opt)

-- Helper function for commands
function _G.preserve(cmd)
  cmd = string.format('keepjumps keeppatterns execute %q', cmd)
  local original_cursor = vim.fn.winsaveview()
  vim.api.nvim_command(cmd)
  vim.fn.winrestview(original_cursor)
end

--
-- Command configurations
--

-- Command 'TrimSpaces' well... it's self-explanatory what this does
vim.cmd([[
  command! TrimSpaces lua require("core.utils").preserve('%s/\\s\\+$//ge')
]])

-- Reindent the current buffer
vim.cmd([[
  command! Reindent lua require("core.utils").preserve("sil keepj normal! gg=G")
]])
