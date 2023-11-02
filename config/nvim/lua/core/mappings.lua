-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   all_modes = ""

local opt = { noremap = true, silent = true }
local opt_expr = vim.tbl_extend("force", opt, { expr = true })
local desc = require("core.utils").desc

-- Yank and paste text from clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], desc(opt, "Cop[y] to clipboard"))
vim.keymap.set({ "n", "v" }, "<Leader>p", [["+p]], desc(opt, "[p]aste from clipboard"))

-- use ESC in normal mode to turn off search highlighting and notifycations
vim.keymap.set("n", "<Esc>", function()
  require("notify").dismiss()
  vim.cmd.nohlsearch()
end, opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k',
-- also don't use g[j|k] when in operator pending mode (using 10j or 10k)
vim.keymap.set("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opt_expr)
vim.keymap.set("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opt_expr)

-- Consistent movement
vim.keymap.set({ "n", "v" }, "gh", "^", desc(opt, "Beginning of the line"))
vim.keymap.set({ "n", "v" }, "gl", "$", desc(opt, "End of the line"))

-- Easy edits
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("v", ">", ">gv", opt)
vim.keymap.set({ "n", "x" }, "Y", "yg$", desc(opt, "Copy until EOL"))

-- Jump quickfix list
vim.keymap.set("n", "[c", "<cmd>cprevious<CR>", desc(opt, "Previous qui[c]kfix list"))
vim.keymap.set("n", "]c", "<cmd>cnext<CR>", desc(opt, "Next qui[c]kfix list"))

-- Buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", desc(opt, "Previous in [b]uffer list"))
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", desc(opt, "Next in [b]uffer list"))
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", desc(opt, "Previous file"))
vim.keymap.set("n", "<Leader>L", "<C-w>L", desc(opt, "Move buffer to the RIGHT"))
vim.keymap.set("n", "<Leader>H", "<C-w>H", desc(opt, "Move buffer to the LEFT"))

-- Toggle spelling (spanish and english)
vim.keymap.set("n", "<Leader>ss",
  function() require('core.utils').toggleSpelling('es') end,
  desc(opt, "[s]pelling [s]panish")
)
vim.keymap.set("n", "<Leader>se",
  function() require('core.utils').toggleSpelling('en_us') end,
  desc(opt, "[s]pelling [e]nglish")
)

-- Navigate between vim buffers, vim splits and tmux panes
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>NavigatorLeft<cr>", opt)
vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>NavigatorRight<cr>", opt)
vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd>NavigatorUp<cr>", opt)
vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd>NavigatorDown<cr>", opt)

-- oil
vim.keymap.set({ "n", "v" }, "-", "<cmd>Oil<cr>", { desc = "Open tree directory view" })

-- Telescope
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", desc(opt, "[f]ind [f]ile"))
vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", desc(opt, "[f]ind [b]uffer"))
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc(opt, "[f]ind [g]rep"))
vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", desc(opt, "[f]ind [h]elp"))
vim.keymap.set("n", "<Leader>fk", "<cmd>Telescope keymaps<cr>", desc(opt, "[f]ind [k]eymap"))

--
-- User commands
--

-- Command 'TrimSpaces' well... it's self-explanatory what this does
vim.api.nvim_create_user_command(
  "TrimSpaces",
  function() require("core.utils").preserve('%s/\\s\\+$//ge') end,
  { desc = "Trim extra whitespaces" }
)

-- Fix indentation of the current buffer
vim.api.nvim_create_user_command(
  "Reindent",
  function() require("core.utils").preserve("sil keepj normal! gg=G") end,
  { desc = "Fix indentation of the current file" }
)
