"
" Default settings
"

set encoding=utf-8

" Global highlights
syntax enable
set cursorline
set laststatus=2

" Change cursors between modes (if tmux is running, use tmux's special characters)
" (compatible with urxvt, st, xterm, gnome-terminal 3.x, Konsole, KDE5)
" SI = Insert mode, SR = Replace mode, EI = Normal mode
if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[6 q\e\\"
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

" Annoying things
set lazyredraw          " Don't update the screen during macros or scripts executions
set belloff=all         " Never ring the bell
set shortmess+=I        " Dont'n show intro message of Vim
set shortmess+=T        " Too big for the command line? put ...
set shortmess+=W        " Don't echo [w]/[written] when writing a file
set shortmess+=a        " Use all abbreviations eg. [RO] instead of [readonly]
set shortmess+=t        " Truncate files messages at start

" Fast toggle bewtween different modes
set timeoutlen=1000 ttimeoutlen=0

" Backspace to normal
set backspace=indent,eol,start

" View configuration
set number relativenumber
set scrolloff=3     " Start scrolling 3 lines before edge of viewport
set sidescrolloff=3 " Same to scrolloff but with columns
set linebreak             " Wrap taking to account words
set breakindent           " Indent wrap text

if has('linebreak')
    let &showbreak='↳ '   " Downwards arrow with tip rightwards (U+21B3)
endif

" Move backup files out of the way and don't create root-owned files
" The '//' means that the files created on tmp/ will have a unique ID
if exists('$SUDO_USER')
    set nobackup
    set nowritebackup
    set noswapfile
else
    set backupdir=~/.vim/tmp/backup//
    set backupdir+=.

    set directory=~/.vim/tmp/swap//
    set directory+=.

    set viewdir=~/.vim/tmp/view//
    set viewoptions=cursor,folds
endif

" Show invisible characters and editor options
set list
set listchars=nbsp:⦸                  " Empty set symbol (U+29B8)
set listchars+=tab:\|\                " The normal pipe character
set listchars+=extends:»              " Two right arrows (U+00BB)
set listchars+=precedes:«             " Two left arrows (U+00AB)
set listchars+=trail:•                " Middel dot(U+2022)

" Fill chars for diff and folds
set fillchars=diff:∙          " Bullet operator (U+2219)
set fillchars+=vert:┃         " Box drawings heavy vertical (U+2503)
set fillchars+=fold:·         " Up dot (U+00B7)

" Format options related
set formatoptions+=j    " Remove comment leader when joining lines
set formatoptions+=n    " Recognize numbered lists

" GUI options
set guioptions-=T   " Don't show toolbar
set guioptions-=l   " Don't show scroll bar on windows
set guioptions-=L   " Don't show scrollbar on split windows
set guioptions-=r   " Don't show right scrollbar
set guioptions-=R   " Don't shor right scrollbar on split windows
set guioptions-=b   " Don't show bottom scrollbar

" Buffer related
set splitbelow  " Puts horizontal windows to the bottom
set splitright  " Puts vertical windows to the right
set hidden      " Allow you to hide buffers with unsaved changes
set autoread    " When a file is change outside the editor, vim try to read it again

" Tabs ('\t') configurations
set tabstop=4       " Tab is 4 spaces wide
set shiftwidth=4    " How much spaces to take when << or >> is used on Normal Mode
set expandtab       " Make the tab key insert spaces instead of tabs
set smarttab        " Delete a hole tab in insert mode when you use <BS>
set autoindent      " Copy the indent of the current line when a new line is create

" Wildmenu configuration
set wildmenu                    " Completitions on command mode
set wildmode=longest:full,full  " Long list on wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.ttf
set wildignore+=.DS_Store,*.pdf,*/target/*,*/.git/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Folds configurations
set diffopt+=foldcolumn:0     " Don't show fold column in diff view
set foldmethod=indent         " Fold by indentation
set foldlevel=99              " No fold when open a file
set foldtext=FoldText()       " How folds look like

function! FoldText() abort
    let s:middot='·'
    let s:raquo='»'
    let s:small_l='ℓ'

    let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
    let l:first=substitute(getline(v:foldstart), '\v *', '', '')
    let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
    return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

"
" Highlights configs (some colors changes, https://github.com/wincent/pinnacle)
"

" True colors on terminal
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Change underlined for current line number and italics for comments
execute 'highlight! CursorLineNr cterm=NONE'
execute 'highlight! Comment ' . pinnacle#italicize("Comment")

" Same background for line numbers
execute 'highlight! LineNr guibg=' . pinnacle#extract_bg("Normal")

" Match the cursorline colors to the visual colors
execute 'highlight! Visual guibg=' . pinnacle#extract_bg("CursorLine")

" Stand out MatchParen
execute 'highlight! MatchParen cterm=bold guibg=NONE' .
            \ ' guifg=' . pinnacle#extract_bg("Error")

" Wildmenu Colors
execute 'highlight! WildMenu guibg=' . pinnacle#extract_fg("Function") .
            \ ' guifg=' . pinnacle#extract_bg("StatusLine")

" Better search and quicfixline colors
execute 'highlight! QuickFixLine ' . pinnacle#extract_highlight("CursorLine")
highlight! clear Search
execute 'highlight! Search ' . pinnacle#embolden("Underlined")

" Spell checking colors
execute 'highlight! SpellBad cterm=bold,underline guibg=NONE guifg=' . pinnacle#extract_fg("Identifier")
execute 'highlight! SpellLocal guibg=NONE cterm=bold,underline guifg=' . pinnacle#extract_fg("Constant")
execute 'highlight! SpellCap guibg=NONE cterm=bold,underline guifg=' . pinnacle#extract_fg("Function")
execute 'highlight! SpellRare cterm=bold,underline guibg=NONE guifg=' . pinnacle#extract_fg("Define")

" Terminal buffer statusline
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC

