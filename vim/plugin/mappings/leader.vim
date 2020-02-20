"
" Leader bindings
"

let mapleader = " "

"
" Plugin bindings
"

" Ultisnips edit on veritcal split
nnoremap <leader>u :UltiSnipsEdit<CR>
" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>b :Buffers<CR>

" Buffer and window related bindings
nnoremap <leader>d :bdelete<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>L <C-w>L

" Check if is need it to install: vim --version | grep clipboard
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" requiered for ubuntu (vim-gtk/vim-gnome) or CentOs/Redhat (vim-X11) on Arch gvim
vnoremap <leader>y "+y
vnoremap <leader>x "+d

" Toggle accent keys
nnoremap <leader>a :call ToggleAccent()<CR>

