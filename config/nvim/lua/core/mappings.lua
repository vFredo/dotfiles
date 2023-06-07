local map = require("core.utils").map
local command = require("core.utils").command
local opt = { noremap = true, silent = true }
local opt_expr = vim.tbl_extend("force", opt, { expr = true })

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   all_modes = ""

-- Yank and paste text from clipboard
map({ "n", "v" }, "<Leader>y", [["+y]], opt)
map({ "n", "v" }, "<Leader>p", [["+p]], opt)

-- use ESC in normal mode to turn off search highlighting
map("n", "<Esc>", function()
  require("notify").dismiss()
  vim.cmd.nohlsearch()
end, opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k',
-- also don't use g[j|k] when in operator pending mode (using 10j or 10k)
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opt_expr)
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opt_expr)

-- Consistent movement
map({ "n", "v" }, "gh", "^", opt)
map({ "n", "v" }, "gl", "$", opt)

-- Easy edits
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map({ "n", "x" }, "Y", "yg$", opt)

-- Jump quickfix list
map("n", "[c", "<cmd>cprevious<CR>", opt)
map("n", "]c", "<cmd>cnext<CR>", opt)

-- Buffers
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L", opt)
map("n", "<Leader>H", "<C-w>H", opt)

-- Toggle spelling (spanish and english)
map("n", "<Leader>ss",
  function() require('core.utils').toggleSpelling('es') end, opt)
map("n", "<Leader>se",
  function() require('core.utils').toggleSpelling('en_us') end, opt)

-- Navigate between vim buffers, vim splits and tmux panes
map({ "n", "v" }, "<C-h>", "<cmd>NavigatorLeft<cr>", opt)
map({ "n", "v" }, "<C-l>", "<cmd>NavigatorRight<cr>", opt)
map({ "n", "v" }, "<C-k>", "<cmd>NavigatorUp<cr>", opt)
map({ "n", "v" }, "<C-j>", "<cmd>NavigatorDown<cr>", opt)

-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opt)
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opt)
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", opt)
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opt)

-- Bufferline
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", opt)
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", opt)

--
-- User commands
--

-- Command 'TrimSpaces' well... it's self-explanatory what this does
command("TrimSpaces",
  function() require("core.utils").preserve('%s/\\s\\+$//ge') end)

-- Correct indentation of the current buffer
command("Reindent",
  function() require("core.utils").preserve("sil keepj normal! gg=G") end)
