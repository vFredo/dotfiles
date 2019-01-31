" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =
" Reloafing .vimrc file
autocmd! bufwritepost .vimrc source %

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins that wnated to install via name and name of repositorie
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'zefei/vim-wintabs'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

" Important keybiding
:let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>e :e **/*
nnoremap <leader>f :NERDTreeToggle<CR>

" Better navigation in panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Delte all arrows commands
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"Numbers left side
set nu  " Set current line  number
set numberwidth=5
set nostartofline 
set linespace=3

"Max character width
set textwidth=80
set colorcolumn=+1

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

"Move code blocks 
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Nice colors and color scheme
set t_Co=256
colorscheme  minimalist

" Vim bars
set laststatus=2 "Status line On
set noshowmode " Lightline plugin take care of the modes

" Change between buffers
" (,n - Next Buffer, ,b - previous buffer, ,d - delete buffer)
" (,l - List of buffers)
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>
nnoremap <leader>l :ls<CR>

" Search usage 
set hls is " Highlight and show a line under words search
set ic
set history=300
set wildmenu " Makig a suggestion menu in searches and autocomlition in :
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj

" Making transition modes more fast
set timeoutlen=1000 ttimeoutlen=5

" ------------------------ Plugins Configurations -------------------

" light line plugin configurations
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo'],
    \              [ 'percent' ],
    \              [ 'filetype', 'fileencoding' ] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" Function for making the fonts look good in lightline status bar
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" NERDTree Plugin configurations
" Close vim if the only window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

