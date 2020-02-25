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
" requiered for Ubuntu (vim-gtk/vim-gnome), CentOs/Redhat (vim-X11) and Arch (gvim)
vnoremap <leader>y "+y
vnoremap <leader>d "+d

" Toggle accent keys
nnoremap <leader>a :call ToggleAccent()<CR>

