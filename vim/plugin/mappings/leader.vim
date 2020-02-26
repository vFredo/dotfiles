"
" Leader bindings
"

let mapleader = " "

"
" Plugin bindings
"

" Ultisnips edit on vertical split
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

" Toggle spelling syntax with es or us_en
function! mappings#leader#toggle_spell(languaje) abort
    if a:languaje == "Spanish"
        setlocal spelllang=es
    else
        setlocal spelllang=en_us
    endif
    setlocal spell!
    if &spell
        inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u
        echo "Spell with " . a:languaje . ": ON"
    else
        echo "Spell: OFF"
    endif
endfunction

" mnemonic 's'pell 's'panish and 's'pell 'e'nglish
nnoremap <leader>ss :call mappings#leader#toggle_spell("Spanish")<CR>
nnoremap <leader>se :call mappings#leader#toggle_spell("English")<CR>

