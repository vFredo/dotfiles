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

-- use ESC in normal mode to turn off search highlighting and notifications
vim.keymap.set("n", "<Esc>", function()
  local ok, notify = pcall(require, "notify")
  if ok then
    notify.dismiss()
  end
  vim.cmd.nohlsearch()
end, opt)

-- Yank and paste text from clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], desc(opt, "Cop[y] to clipboard"))
vim.keymap.set({ "n", "v" }, "<Leader>p", [["+p]], desc(opt, "[p]aste from clipboard"))

-- Don't save delete elements into the copy register
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]], desc(opt, "[d]elete to null register"))
vim.keymap.set("n", "x", [["_x]], opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k',
-- also don't use g[j|k] when in operator pending mode (using 10j or 10k)
vim.keymap.set("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opt_expr)
vim.keymap.set("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opt_expr)

-- Consistent movement
vim.keymap.set({ "n", "v" }, "gh", "^", desc(opt, "Beginning of the line"))
vim.keymap.set({ "n", "v" }, "gl", "$", desc(opt, "End of the line"))

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

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
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", desc(opt, "Previous buffer"))

-- Toggle spelling (spanish and english)
vim.keymap.set("n", "<Leader>ss",
  function() require('core.utils').toggleSpelling('es') end,
  desc(opt, "[s]pelling [s]panish")
)
vim.keymap.set("n", "<Leader>se",
  function() require('core.utils').toggleSpelling('en_us') end,
  desc(opt, "[s]pelling [e]nglish")
)

--
-- User commands
--

-- Fix indentation of the current buffer
vim.api.nvim_create_user_command(
  "Reindent",
  function() require("core.utils").preserve("sil keepj normal! gg=G") end,
  { desc = "Fix indentation of the current file" }
)
