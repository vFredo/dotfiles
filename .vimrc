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
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" Config mouse
set mouse=a

" Important keybidings
let mapleader = ","
nnoremap <leader>f :NERDTreeToggle<CR>

" Change between buffers
" (,n - Next Buffer, ,b - Previous Buffer, ,d - Delete Buffer)
nnoremap <leader>m :bn<CR>
nnoremap <leader>n :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>

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
nnoremap <C-e> <C-e><C-e><C-e>
nnoremap <C-y> <C-y><C-y><C-y>

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
set numberwidth=5
set nostartofline 
set linespace=3

"Max character width
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
set autoread
set ruler "Show cursor position all the time
set bs=2 "Backspace normal again
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
set ic " Ignore text case
set history=300
autocmd InsertLeave * : setlocal hlsearch " The hl words are no longer hl
autocmd InsertEnter * : setlocal nohlsearch " The hl of the words come again

" Wildmenu configuration
set wildmenu " Makig a suggestion menu in searches and autocomlition in : menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj

" Making transition between modes more fast
set timeoutlen=1000 ttimeoutlen=5

" Nice looking colors in terminal
if (has("termguicolors"))
  set termguicolors
endif

" ------------------------ Plugins Configurations -------------------

" --- NERDTree Plugin configurations ---
" Close vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in the NERDTree
let NERDTreeShowHidden=1

" --- Minimalist theme configuration ---
colorscheme minimalist

" --- Closetag Plugin configuration ---
let g:closetag_filetypes = 'html,xhtml,phtml'

" --- Live preview Latex Plugin ---
nnoremap <leader>l :LLPStartPreview<CR>
nnoremap <leader>L :LLPStartPreview 

