" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =
" Reloading .vimrc file
autocmd! bufwritepost .vimrc source %

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" For Github repos 'username/repository'
Plugin 'VundleVim/Vundle.vim'
Plugin 'dikiaap/minimalist'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

" Important keybidings
let mapleader = ","
nnoremap <leader>f :NERDTreeToggle<CR>

" Change between buffers
" (,n - Next Buffer, ,b - Previous Buffer, ,d - Delete Buffer)
nnoremap <leader>m :bn<CR>
nnoremap <leader>n :bp<CR>
nnoremap <leader>d :bd<CR>

" Install on Ubuntu vim-gtk or vim-gnome for this to work.
" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" In CentOS/Redhay install vim-X11

" This is for copying text from vim to the desktop clipboard"
vnoremap <leader>c "+y
" For cut text from vim to the desktop clipboard
vnoremap <leader>x "+d

" Better navigation in the page go up 3 lines and down 3 lines 
" With Ctrl + e and Ctrl + y
nnoremap <S-e> <C-e><C-e><C-e>
nnoremap <S-y> <C-y><C-y><C-y>

" Better navigation between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"Move code blocks more easily
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

"Numbers left side
set nu  " Set current line number
set nostartofline 
set scrolloff=2 " Keep visible the lines below/above the cursor in the window

" Title configuration
" Set title of the current buffer
autocmd BufEnter * let &titlestring = expand("%:@")
set title " Title of the current file working
set titleold= " Set last little to the current screen when is not in vim


"Syntax highlighting
set cursorline
syntax enable

" Wrap
set fo-=t " don't automatically text when typing
set backspace=indent,eol,start
set hidden " For have files open without displaying on the screeen (Buffers)
set autoread " When a file is change outside vim, it read it again
set ruler "Show cursor position all the time
set spr

" Tabs configurations: Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set noerrorbells " No sound in the editor

" Search configuration
set hls is " Highlight and show a line under words search
set smartcase " Dont ignore capital case when searh
autocmd InsertLeave * : setlocal hlsearch " The hl words are no longer hl
autocmd InsertEnter * : setlocal nohlsearch " The hl of the words come again

" Wildmenu configuration
set wildmenu " Makig a suggestion menu in searches and autocomlition in : menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Making transition between modes more fast
set timeoutlen=1000 ttimeoutlen=5

" Nice looking colors in terminal
if (has("termguicolors"))
  set termguicolors
endif

" ------------------------ Plugins Configurations -------------------

" --- NERDTree Plugin configurations ---
let NERDTreeShowHidden=1

" --- Minimalist theme configuration ---
colorscheme minimalist

" --- Closetag Plugin configuration ---
let g:closetag_filetypes = 'html,xhtml,phtml'

" --- Vimtex Plugin cofiguration ---
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" Make symbols and special characters view nice or invisible in .tex files
set conceallevel=1
let g:tex_conceal='abdmg'
map <leader>l :VimtexCompile<CR>

