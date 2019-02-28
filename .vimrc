" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =
" Reloafing .vimrc file
autocmd! bufwritepost .vimrc source %

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins wanted to install via name and name of repositorie
Plugin 'VundleVim/Vundle.vim'
Plugin 'zefei/vim-wintabs'
Plugin 'kaicataldo/material.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" Important keybidings
:let mapleader = ","
nnoremap <leader>f :NERDTreeToggle<CR>

" Change between buffers
" (,n - Next Buffer, ,b - previous buffer, ,d - delete buffer)
" (,l - List of buffers) (,b [file name] - open a buffer with that filename)
nnoremap <leader>m :bn<CR>
nnoremap <leader>n :bp<CR>
nnoremap <leader>b :b 
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>
nnoremap <leader>l :ls<CR>

" Install on Ubuntu vim-gtk or vim-gnome for this to work
" Check is need it to install with vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear if not, install)
" CentOS/Redhay install vim-X11
" This is for copying text from vim to the desktop clipboard"
vnoremap <leader>c "+y
" For cut text from vim to the desktop clipboard
vnoremap <leader>x "+d

" Better navigation in the page go up 3 lines and down 3 lines 
" With Ctrl + e and Ctrl + y
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>

" Better navigation in panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"Move code blocks 
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

"Numbers left side
set nu  " Set current line number
set rnu " Set relative number
set numberwidth=5
set nostartofline 
set linespace=3

"Max character width
set textwidth=80
set colorcolumn=+1
set scrolloff=2 " Keep visible the lines below/above the cursor in the window

"Syntax highlighting
:se cursorline
syntax enable

" Wrap
set fo-=t " don't automatically text when typing
set backspace=indent,eol,start
set hidden " Hidden Buffers
set autoread
set ruler "Show cursor position all the time
set bs=2 "Backspace normal again
set spr

"Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set noerrorbells " No sound in the editor

" Nice colors and material color scheme
if (has("termguicolors"))
  set termguicolors
endif

" Search usage 
set hls is " Highlight and show a line under words search
set ic " Ignore text case
set history=300
set wildmenu " Makig a suggestion menu in searches and autocomlition in :
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj

" Making transition modes more fast
set timeoutlen=1000 ttimeoutlen=5


" ------------------------ Plugins Configurations -------------------

" NERDTree Plugin configurations 
" Close vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in the NERDTree
let NERDTreeShowHidden=1

" Gruvbox theme configuration
set background=dark
colorscheme gruvbox
