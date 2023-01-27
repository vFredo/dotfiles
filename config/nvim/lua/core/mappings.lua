local map = require("core.utils").map
local opt = { noremap = true, silent = true }
local opt_expr = vim.tbl_extend("force", opt, { expr = true })

-- Yank and paste text from clipboard
map({ "n", "v" }, "<Leader>y", [["+y]], opt)
map({ "n", "v" }, "<Leader>p", [["+p]], opt)

-- use ESC in normal mode to turn off search highlighting
map("n", "<Esc>", ":nohlsearch<CR>", opt)

-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opt)
map("n", "<Leader>fb", "<cmd>Telescope buffers ignore_current_buffer=true<CR>", opt)
map("n", "<Leader>fg",
  "<cmd>Telescope live_grep additional_args='--hidden'<CR>", opt)
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", opt)

-- nvim-tree
map("n", "<Leader>t", ":NvimTreeToggle<CR>", opt)

-- Git
map("n", "<Leader>g", ":vert Git<CR>", opt)

-- Consistent movement
map({ "n", "v" }, "gh", "^", opt)
map({ "n", "v" }, "gl", "$", opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k', also
-- don't use g[j|k] when in operator pending mode, so it doesn't alter 'd', 'y' or 'c'
-- empty mode is same as using :map
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opt_expr)
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opt_expr)

-- Buffers
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L", opt)
map("n", "<Leader>H", "<C-w>H", opt)
map("n", "[b", ":BufferLineCyclePrev<CR>", opt)
map("n", "]b", ":BufferLineCycleNext<CR>", opt)

-- Navigate between vim buffers, vim splits and tmux panes
map({ "n", "v" }, "<C-h>",
  function() require('Navigator').left() end, opt)
map({ "n", "v" }, "<C-l>",
  function() require('Navigator').right() end, opt)
map({ "n", "v" }, "<C-k>",
  function() require('Navigator').up() end, opt)
map({ "n", "v" }, "<C-j>",
  function() require('Navigator').down() end, opt)

-- Easy edits
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map({ "n", "x" }, "Y", "yg$", opt)

-- Jump quickfix list
map("n", "[l", ":cprevious<CR>", opt)
map("n", "]l", ":cnext<CR>", opt)

-- Hop nvim bindings change f,F,t,T,s behave with hop
local directions = require('hop.hint').HintDirection

map('', 'f', function()
  require('hop').hint_char1({
    direction = directions.AFTER_CURSOR,
    current_line_only = true
  })
end, {remap=true})

map('', 'F', function()
  require('hop').hint_char1({
    direction = directions.BEFORE_CURSOR,
    current_line_only = true
  })
end, {remap=true})

map('', 't', function()
  require('hop').hint_char1({
    direction = directions.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end, {remap=true})

map('', 'T', function()
  require('hop').hint_char1({
    direction = directions.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = 1
  })
end, {remap=true})

map('', 's', function () require('hop').hint_char2() end, {remap=true})

--
-- Toggle spelling (spanish and english)
--
map("n", "<Leader>ss",
  function() require('core.utils').toggleSpelling('es') end, opt)
map("n", "<Leader>se",
  function() require('core.utils').toggleSpelling('en_us') end, opt)

--
-- Commands
--

-- Command 'TrimSpaces' well... it's self-explanatory what this does
vim.cmd([[
  command! TrimSpaces lua require("core.utils").preserve('%s/\\s\\+$//ge')
]])

-- Reindent the current buffer
vim.cmd([[
  command! Reindent lua require("core.utils").preserve("sil keepj normal! gg=G")
]])
