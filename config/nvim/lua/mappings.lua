local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {  }

-- Yank selected text from neovim to the clipboard
vim.cmd([[ noremap <Leader>y "+y ]])

-- use ESC in normal mode to turn off search highlighting
map("n", "<Esc>", ":nohlsearch<CR>", opt)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers ignore_current_buffer=true<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep additional_args=--hidden<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)

-- nvim-tree
map("n", "<Leader>t", ":NvimTreeToggle<CR>", opt)
map("n", "<F6>", ":NvimTreeRefresh<CR>", opt)

-- Consistent movement
map("n", "gh", "^", opt)
map("n", "gl", "$", opt)
map("v", "gh", "^", opt)
map("v", "gl", "$", opt)

-- Allow moving the cursor through wrapped visual lines with 'j' and 'k', also
-- don't use g[j|k] when in operator pending mode, so it doesn't alter 'd', 'y' or 'c'
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Buffers
map("n", "<Leader>d", ":Sayonara<CR>", opt)
map("n", "<Leader>l", ":bnext<CR>", opt)
map("n", "<Leader>h", ":bprevious<CR>", opt)
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L",opt)
map("n", "<Leader>H", "<C-w>H",opt)
map("x", "<C-h>", "<C-w>h", opt)
map("x", "<C-j>", "<C-w>j", opt)
map("x", "<C-k>", "<C-w>k", opt)
map("x", "<C-l>", "<C-w>l", opt)

-- Easy edits
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("n", "Y", "y$", opt)

-- Jump quickfix list
map("n", "<Up>", ":cprevious<CR>", opt)
map("n", "<Down>", ":cnext<CR>", opt)
map("n", "<Left>", ":cpfile<CR>", opt)
map("n", "<Right>", ":cnfile<CR>", opt)

-- Command 'TrimSpaces' well... it's self-explanatory what this does
vim.cmd([[
  function TrimWhiteSpace()
    %s/\s*$//
    ''
  endfunction
  command! -bar -nargs=0 TrimSpaces call TrimWhiteSpace()
]])

-- Toggle maximize buffer and split structure
-- https://github.com/caenrique/nvim-maximize-window-toggle
vim.cmd([[
  function ToggleOnlyBuffer()
    if winnr("$") > 1
    " There are more than one window in this tab
      if exists("b:maximized_window_id")
        call win_gotoid(b:maximized_window_id)
      else
        let b:origin_window_id = win_getid()
        tab sp
        let b:maximized_window_id = win_getid()
      endif
    else
    " This is the only window in this tab
      if exists("b:origin_window_id")
        let l:origin_window_id = b:origin_window_id
        tabclose
        call win_gotoid(l:origin_window_id)
        unlet b:maximized_window_id
        unlet b:origin_window_id
      endif
    endif
  endfunction
  command! ToggleMaximize call ToggleOnlyBuffer()
]])
map("n", "<Leader>o", ":ToggleMaximize<CR>", opt)
