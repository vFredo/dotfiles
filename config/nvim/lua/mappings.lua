local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {  }

vim.cmd([[
  xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  xnoremap <C-h> <C-w>h
  xnoremap <C-j> <C-w>j
  xnoremap <C-k> <C-w>k
  xnoremap <C-l> <C-w>l
  noremap <Leader>y "+y
]])

-- Folding
map("n", "<Tab>", "za", opt)

-- ESC for turning off highlight search
map("n", "<Esc>", ":nohl<CR>", opt)

-- nvim-tree
map("n", "<Leader>n", ":NvimTreeToggle<CR>", opt)
map("n", "<F6>", ":NvimTreeRefresh<CR>", opt)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)

-- Ultisnips
map("n", "<Leader>u", ":UltiSnipsEdit<CR>", opt)

-- Consistent movement
map("n", "gh", "^", opt)
map("n", "gl", "$", opt)
map("v", "gh", "^", opt)
map("v", "gl", "$", opt)

-- Buffers
map("n", "<Leader>l", ":bn<CR>", opt)
map("n", "<Leader>h", ":bp<CR>", opt)
map("n", "<Leader>d", ":bd<CR>", opt)

-- Edit tabulation on visual mode more easily
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
