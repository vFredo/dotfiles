local g = vim.g
local opt = vim.opt

-- Change cursor in normal, insert and replace modes on tmux and terminal
vim.cmd([[
  filetype plugin on

  if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[6 q\e\\"
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
  else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
  endif
]])

--
-- General options
--
g.mapleader        = " " -- Map leader is <Space>
opt.cursorline     = true -- Current line highlight
opt.laststatus     = 0 -- Don't show statusline
opt.virtualedit    = "block" -- edit lines in v-block with no characters
opt.guifont        = "Iosevka Nerd Font:h12" -- GUI font for eg: neovide
opt.ignorecase     = true -- ignore case on '/', '?', '*', '#'
opt.smartcase      = true -- override ignorecase if there is an uppercase
opt.termguicolors  = true -- Use all the color pallette
opt.signcolumn     = "yes:2" -- show signcolumn and the number is max signs to show
opt.mouse          = "a" -- Mouse support for neovim
opt.number         = true -- Line number
opt.relativenumber = true -- Relatives number to the current line
opt.hidden         = true -- Change between buffers even if I don't save the current one
opt.updatetime     = 300 -- Change between modes more faster
opt.joinspaces     = false -- don't auto insert two spaces after punctuation
opt.wildmode       = "longest:full,full" -- shell-like auto complete to unambiguous portion
opt.wildignore     = { 'node_modules/*', '.git/*', '*.o', '*.pdf', '*.so', '*.rej' } -- files to ignore
opt.spelllang      = { 'en_us', 'es' } -- spell check on this languages
opt.spellsuggest   = { "best", 9 } -- Nine spell checking candidates at most

-- Viewport
opt.scrolloff     = 3 -- start scrolling 3 lines before edge of the rows viewport
opt.sidescrolloff = 3 -- start scrolling 3 lines before edge of the columns viewport
opt.splitbelow    = true -- open horizontal splits below current window
opt.splitright    = true -- open vertical splits to the right current window

-- Tabs (\t) and indentation
opt.shiftwidth  = 2
opt.tabstop     = 2
opt.expandtab   = true
opt.smartindent = true

-- Abreviations
opt.shortmess:append('I') -- no splash screen
opt.shortmess:append('a') -- Abreviations eg. `[RO]` instead of `[readonly]`
opt.shortmess:append('c') -- avoid show extra message in completion
opt.shortmess:append('f') -- Use "(3 of 5)" instead of "(file 3 of 5)"
opt.completeopt = { 'menuone', 'noinsert', 'noselect', 'preview' } -- https://www.youtube.com/watch?v=-3S4xVDpLzI
opt.diffopt:append('vertical') -- Show diffs in vertical splits

-- Folds
opt.diffopt:append('foldcolumn:0') -- don't show foldcolumn in diff view
opt.foldlevelstart = 99 -- Fold level start '99' = without folds
opt.foldmethod     = 'indent' -- default fold method

--
-- Characters
--
opt.joinspaces  = false -- don't autoinsert two spaces after '.', '?', '!' for join command
opt.lazyredraw  = true -- don't bother updating screen during macro playback
opt.linebreak   = true -- wrap long lines at characters in 'breakat'
opt.breakindent = true -- Indent wrap text
opt.showbreak   = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3)
opt.list        = true -- show whitespace and everything on the listchars
opt.listchars   = {
  nbsp     = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8)
  extends  = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB)
  precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB)
  tab      = '  ', -- I have plugin that takes cares of this character
  trail    = '•' -- MIDDLE BULLET (U+2022)
}
opt.fillchars   = {
  diff = '∙', -- BULLET OPERATOR (U+2219)
  eob  = ' ', -- NO-BREAK SPACE (U+00A0) to suppress ~ at EndOfBuffer
  fold = '·', -- MIDDLE DOT (U+00B7)
  vert = '┃', -- BOX DRAWINGS HEAVY VERTICAL (U+2503)
}
