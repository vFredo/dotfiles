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

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)

-- nvim-tree
map("n", "<Leader>t", ":NvimTreeToggle<CR>", opt)
map("n", "<F6>", ":NvimTreeRefresh<CR>", opt)

-- Consistent movement
map("n", "gh", "^", opt)
map("n", "gl", "$", opt)
map("v", "gh", "^", opt)
map("v", "gl", "$", opt)

-- use gj/gk as j/k to move between lines, but if you do <count>j/k, use the default 'j/k' key
vim.cmd([[
  xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
]])

-- Buffers
map("n", "<Leader>l", ":bnext<CR>", opt)
map("n", "<Leader>h", ":bprevious<CR>", opt)
map("n", "<Leader>d", ":bdelete<CR>", opt)
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L",opt)
map("n", "<Leader>H", "<C-w>H",opt)
vim.cmd([[
  xnoremap <C-h> <C-w>h
  xnoremap <C-j> <C-w>j
  xnoremap <C-k> <C-w>k
  xnoremap <C-l> <C-w>l
]])

-- Edit tabulation on visual mode more easily
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

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
map("n", "<Leader>o", ":ToggleMaximize<CR>")

