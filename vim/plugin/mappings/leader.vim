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

" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" Requiered for ubuntu (vim-gtk/vim-gnome) or CentOs/Redhat (vim-X11)
" Copy to clipboard (",y") and paste to clipboard(",x")
vnoremap <leader>y "+y
vnoremap <leader>x "+d

