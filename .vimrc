"  Reloading .vimrc file
autocmd! BufWritePost .vimrc source %
autocmd! BufWritePost .vimrc call lightline#update()

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'         " Useful snippets
Plug 'lervag/vimtex'            " Latex compiler and syntax
Plug 'suy/vim-context-commentstring' " Know the type of file to comment
Plug 'tpope/vim-commentary'     " Comment lines more easely
Plug 'jiangmiao/auto-pairs'     " Auto complete brackets and parentheses
Plug 'justinmk/vim-sneak'       " Help with navegation
Plug 'chriskempson/base16-vim'  " Nice colorscheme
Plug 'itchyny/lightline.vim'    " Statusline
Plug 'harenome/vim-mipssyntax'  " Mips syntax for vim
Plug 'duggiefresh/vim-easydir'  " Make files and directories on vim
Plug 'tpope/vim-vinegar'        " File search
Plug 'wincent/loupe'            " Saw search commands more easy
" Fuzzy finder, it need apt-get install ruby-dev
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }

call plug#end()

" ------------------------- Keybindings -------------------------
let mapleader = ","

" Plugin bindings
nnoremap <leader>c :VimtexCompile<CR>
nnoremap <leader>u :UltiSnipsEdit<CR>
nnoremap <leader>h :CommandTHelp<CR>

" Buffer related bindings
nnoremap <leader>d :bdelete<CR>
nnoremap <leader><leader> <C-^>

" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" Requiered for ubuntu (vim-gtk/vim-gnome) or CentOs/Redhat (vim-X11)

" Copy to clipboard (",y") and paste to clipboard(",x")
vnoremap <leader>y "+y
vnoremap <leader>x "+d

" Better navigation between panes
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Move code blocks more easily
vnoremap < <gv
vnoremap > >gv 

" Consistent movement
noremap gh ^
noremap gl $
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ------------------- Basic Vim configuration ----------------------

set belloff=all   " Never ring the bell

" Highlight
syntax enable
set cursorline

" Number configuration
set number          " Set current line number
set relativenumber  " Relactive numbers

" Break lines
if has('linebreak')
  set linebreak             " Wrap taking to account words
  let &showbreak='↳ '       " (U+21B3, UTF-8: E2 86 B3)
  set breakindent           " Indent wrapped lines to match start

  if exists('&breakindentopt')
    set breakindentopt=shift:2  " Emphasize broken lines by indenting them
  endif
endif

" Puts vertical windows to right, instead of left and down instead of up
set splitbelow splitright

" Wrap
set fo-=t " Don't automatically text when typing
set backspace=indent,eol,start
set hidden " Allow you to hide buffers with unsaved changes
set autoread " When a file is change outside the editor, vim try to read it again

" Tabs ('\t') configurations: Soft tabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2    " How much spaces to take when << or >> is used on Normal Mode
set shiftround      " When there are multiple lines and you use < or >
set expandtab

" Wildmenu configuration
set wildmenu " Making a suggestion menu in searches and autocompletition on Console Mode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store,*.pdf,*/project/*,*/target/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Nice looking colors on terminal
if (has("termguicolors"))
  set termguicolors
endif

" Colorsheme (Check https://github.com/chriskempson/base16-shell)
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Delete background color of the line that show the numbers
highlight LineNr guibg=NONE
set highlight+=N:DiffText     " Make current line number stand out a little
set shortmess+=W              " Don't echo [w]/[written] when writing

" ------------------------ Plugins Configurations -----------------------

" --------------------- Ultisnips configuration ---------------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="~/Dotfiles/vimSnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Dotfiles/vimSnips']

" Edit vertical Ultisnips edition
let g:UltiSnipsEditSplit="vertical"

" --------------------- Vimtex cofiguration -----------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Symbols and special characters view nice or invisible in .tex files
set conceallevel=1
let g:tex_conceal='abdmg'

" Deleting all the temp files that latexmk compiler make
autocmd VimLeave *.tex !latexmk -c %

" ---------------- CommandT config ------------------------------
let g:CommandTHighlightColor='CursorLine'

" ---------------- Vinegar config ------------------------------
let g:netrw_liststyle = 3

" ------------------ LightLine config ------------------------------
set laststatus=2
set noshowmode
let g:lightline = {
  \   'colorscheme': 'fredoLightline',
  \   'separator': { 'left': '', 'right': '' },
	\   'subseparator': { 'left': '', 'right': '' },
  \   'active': {
  \     'right': [ ['percent'], ['lineinfo'] , ['filetype'] ],
  \     'left': [ [ 'mode', 'paste' ],
  \       [ 'myReadonly', 'relativepath', 'myModified'] ]
  \   },
  \   'component': {
  \     'lineinfo': 'ℓ %3l:%-2v'
  \   },
  \   'component_function': {
  \     'myModified': 'LightlineModified',
  \     'myReadonly': 'LightlineReadonly'
  \   }
  \ }

function! LightlineModified()
  return &modifiable && &modified ? '✘' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" ------------------ MIPS syntax config ------------------------------
autocmd BufNewFile,BufRead *.s set syntax=mips

" ------------------ Sneak config ------------------------------
highlight Sneak guifg=black guibg=salmon ctermfg=black ctermbg=red

