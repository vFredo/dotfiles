"
" Default settings
"

set encoding=utf-8

"Setting statusline
set laststatus=2

" Annoying things
set shortmess+=W      " Don't echo [w]/[written] when writing
set shortmess+=I      " Dont'n show intro message of Vim
set shortmess+=T      " Too big for the command line? put ...
set belloff=all       " Never ring the bell
set mouse=a           " Mouse movement on vim

" Highlight
syntax enable
set cursorline

" Lines configuration
set number          " Set current line number
set relativenumber  " Relactive numbers

if has('linebreak')
  set linebreak             " Wrap taking to account words
  let &showbreak='↳ '       " (U+21B3, UTF-8: E2 86 B3)
  set breakindent           " Indent wrapped lines to match start

  if exists('&breakindentopt')
    set breakindentopt=shift:2  " Emphasize broken lines by indenting them
  endif
endif

" Show whitespaces
set list
set listchars=nbsp:⦸                  " (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " (U+25B7, UTF-8: E2 96 B7) (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " (U+2022, UTF-8: E2 80 A2)

" Puts vertical windows to right, instead of left and down instead of up
set splitbelow splitright

set backspace=indent,eol,start
set hidden " Allow you to hide buffers with unsaved changes
set autoread " When a file is change outside the editor, vim try to read it again

" Tabs ('\t') configurations: Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4    " How much spaces to take when << or >> is used on Normal Mode
set shiftround      " When there are multiple lines and you use < or >
set expandtab

" Wildmenu configuration
set wildmenu " Making a suggestion menu in searches and autocompletition on Console Mode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store,*.pdf,*/project/*,*/target/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Folds configurations
set foldmethod=syntax         " Fold by syntax
set foldlevel=99              " No fold when open a file
set foldtext=FoldText()       " How folds look like
set fillchars+=fold:·         " (U+00B7, UTF-8: C2 B7)

function! FoldText() abort
  let s:middot='·'
  let s:raquo='»'
  let s:small_l='ℓ'

  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

" Change cursors between modes (Also chech if you are using tmux)
" (compaitble with urxvt, st, xterm, gnome-terminal 3.x, Konsole, KDE5)
if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[6 q\e\\"
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

" Fast toggle bewtween the modes
set timeoutlen=1000 ttimeoutlen=0

" Format options reltated
set formatoptions+=j

" Color related
set highlight+=N:DiffText     " Make current line number stand out a little

" Make background transparent of the line numbers
highlight LineNr guibg=NONE

