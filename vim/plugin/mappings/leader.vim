"
" Leader bindings
"

let mapleader = " "

" Plugin bindings
nnoremap <leader>c :VimtexCompile<CR>
nnoremap <leader>u :UltiSnipsEdit<CR>
nnoremap <leader>h :CommandTHelp<CR>

" Buffer and window related bindings
nnoremap <leader>d :bdelete<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>q :q<CR>
nnoremap <leader>l <C-w>L
nnoremap <leader>o :only<CR>

" Check if is need it to install: vim --version | grep clipboard
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" requiered for ubuntu (vim-gtk/vim-gnome) or CentOs/Redhat (vim-X11)
vnoremap <leader>y "+y
vnoremap <leader>x "+d

