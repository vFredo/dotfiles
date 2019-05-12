" Reloading .vimrc file
autocmd! bufwritepost .vimrc source %
" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" ------------- Vundle configuration -------------------
set nocompatible
filetype off " Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " Plugin manager
Plugin 'morhetz/gruvbox'        " Theme of vim
Plugin 'jiangmiao/auto-pairs'   " Autocomplete brackets and pharenthesis
Plugin 'scrooloose/nerdtree'    " File manager for vim
Plugin 'SirVer/ultisnips'       " Useful snippets
Plugin 'lervag/vimtex'          " Latex compiler and syntax
Plugin 'tpope/vim-commentary'   " Comment lines more easely

call vundle#end()
filetype plugin indent on

" ------------------- Keybindings -------------------
let mapleader = ","

" Plugin bindings
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>c :VimtexCompile<CR>

" Change between buffers
nnoremap <leader>d :bd<CR>
nnoremap <leader>l :ls<CR>:b 

" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" Requiered for ubuntu(vim-gtk/vim-gnome) or CentOs/Redhat(vim-X11)

" Copy to clipboard (",c") and paste to clipboard(",x")
vnoremap <leader>c "+y
vnoremap <leader>x "+d

" Better navigation between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"Move code blocks more easily
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" ------------------- Basic vim configuration ----------------------

" Title configuration
" Set title of the current buffer
" autocmd BufEnter * let &titlestring = expand("%:@")
" set title " Title of the current file working
" set titleold= " Set last little to the current screen when is not in vim

" Number Line
set nu  " Set current line number
set rnu " Set relative numbers
set scrolloff=2 " Keep visible the lines below/above the cursor in the window

" Syntax highlighting
set cursorline
syntax enable

" Puts vertical windows to right, instead of left and down instead of up
set splitbelow splitright

" Wrap
set fo-=t " Don't automatically text when typing
set backspace=indent,eol,start
set hidden " For have files open without displaying on the screeen (Buffers)
set autoread " When a file is change outside vim, it read it again
set ruler "Show cursor position all the time

" Tabs configurations: Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set noerrorbells " No sound on the editor

" Search configuration
set hls is " Highlight and show a line under words search
set smartcase " Don't ignore capital case when searh
autocmd InsertEnter * : setlocal nohlsearch " The hl words are no longer hl
" autocmd InsertLeave * : setlocal hlsearch " Comes again the hl words

" Wildmenu configuration
set wildmenu " Makig a suggestion menu in searches and autocompletition in :menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store,*.pdf
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Making transitions between modes more fast
set timeoutlen=1000 ttimeoutlen=5

" Nice looking colors on terminal
if (has("termguicolors"))
    set termguicolors
endif

" ---------------------- Plugins Configurations -----------------------

" ---------------- NERDTree Plugin configurations ----------------------
let NERDTreeShowHidden=1

" ----------------- Nord Plugin theme configuration -----------------
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" --------------------- Ultisnips Plugin configuration ----------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="~/Dotfiles/vimSnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Dotfiles/vimSnips']

" Edit vertical ultisnips edition
let g:UltiSnipsEditSplit="vertical"

" --------------------- Vimtex Plugin cofiguration --------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Symbols and special characters view nice or invisible in .tex files
set conceallevel=1
let g:tex_conceal='abdmg'

" Deliting all the temp files that make the compiler latexmk
autocmd VimLeave *.tex !latexmk -c %

