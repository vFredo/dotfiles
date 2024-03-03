local g = vim.g
local opt = vim.opt

vim.cmd([[filetype plugin indent on]])

--
-- General options
--
g.mapleader       = " "     -- Map leader is <Space>
g.maplocalleader  = ","     -- Local leader map to ','
opt.showmode      = false
opt.background    = "dark"
opt.cmdheight     = 1       -- More space for displaying messages
opt.cursorline    = true    -- Current line highlight
opt.laststatus    = 0       -- Don't show statusline
opt.virtualedit   = "block" -- edit lines in v-block with no characters
opt.ignorecase    = true    -- ignore case on '/', '?', '*', '#'
opt.smartcase     = true    -- override ignore case if there is an uppercase
opt.termguicolors = true    -- Use all the color palette
opt.signcolumn    = "yes"   -- show signcolumn and the number is the max signs to show
opt.mouse         = "a"     -- Mouse support for neovim
opt.number        = true    -- Line number
opt.hidden        = true    -- Change between buffers even if I don't save the current one
opt.updatetime    = 300     -- Fast update time
opt.timeoutlen    = 300     -- By default timeoutlen is 1000 ms
opt.joinspaces    = false   -- don't auto insert two spaces after punctuation
opt.wildmode      = { "list", "longest:full", "full" }
opt.wildignore    = { 'node_modules/*', '.git/*', '*.o', '*.pdf', '*.so', '*.rej' }
opt.spelllang     = { 'en_us', 'es' } -- spell check on this languages

-- Completion options
opt.complete      = { ".", "w", "b", "u", "t", "i", "kspell" }
opt.completeopt:append('menu')     -- Use the pop-up menu.
opt.completeopt:append('menuone')  -- Use the pop-up menu when there is only one match.
opt.completeopt:append('noselect') -- Do not select a match if the menu appears

-- Viewport
opt.scrolloff     = 3    -- scroll 3 lines until edge of the rows viewport
opt.sidescrolloff = 3    -- scroll 3 lines until edge of the columns viewport
opt.splitbelow    = true -- horizontal splits below current window
opt.splitright    = true -- vertical splits to the right current window

-- Tabs (\t) and indentation
opt.smarttab      = true -- Copy indent from current line doing operations
opt.autoindent    = true -- Good auto indent
opt.smartindent   = true -- Makes indenting smart
opt.expandtab     = true -- Converts tabs to spaces
opt.tabstop       = 2    -- number of spaces for a <Tab>
opt.softtabstop   = 2    -- number of spaces inserted for operation
opt.shiftwidth    = 2    -- number of spaces inserted for indentation

-- Abreviations
opt.shortmess:append('I') -- no splash screen
opt.shortmess:append('a') -- Abreviations eg. `[RO]` instead of `[readonly]`
opt.shortmess:append('c') -- avoid show extra message in completion
opt.shortmess:append('f') -- Use "(3 of 5)" instead of "(file 3 of 5)"
opt.shortmess:append('m') -- Use "[+]" instead of "[Modified]".
opt.shortmess:append('r') -- Use "[RO]" instead of "[readonly]".
opt.shortmess:append('w') -- Use "[w]", "[a]" instead of "written", "appended".

-- Diff options
opt.diffopt:append('vertical')     -- Show diffs in vertical splits
opt.diffopt:append('foldcolumn:0') -- don't show foldcolumn in diff view

--
-- Characters
--
opt.joinspaces  = false -- don't autoinsert two spaces after '.', '?', '!' for join command
opt.linebreak   = true -- wrap long lines at words, not in the middle
opt.breakindent = true -- continue indent on wrapped lines
opt.showbreak   = '↳ ' -- prefix at the start when lines have been wrapped
opt.fillchars:append { diff = '∙' } -- deleted lines on diff
opt.fillchars:append { eob = ' ', } -- empty lines at the end of the buffer
opt.fillchars:append { fold = '·' } -- fill foldtext
opt.fillchars:append { foldopen = "" }
opt.fillchars:append { foldclose = "" }
opt.fillchars:append { foldsep = " " }
opt.list = true -- show whitespace and everything on the listchars
opt.listchars:append { nbsp = '⦸' } -- for a non-breakable space character
opt.listchars:append { extends = '»', precedes = '«' }
opt.listchars:append { tab = '▏ ' }
opt.listchars:append { trail = '•' }
