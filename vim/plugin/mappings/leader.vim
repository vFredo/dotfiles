"
" Leader bindings
"

let mapleader = " "

"
" Plugin bindings
"

" Ultisnips edit on vertical split
nnoremap <silent> <leader>u :UltiSnipsEdit<CR>

" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>h :Helptags<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Buffer and window related bindings
nnoremap <silent> <leader>d :bdelete<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>L <C-w>L

" Toggle accent keys
nnoremap <leader>a :call ToggleAccent()<CR>

" Toggle spelling syntax with es or us_en
function! mappings#leader#toggle_spell(languaje) abort
    setlocal spell!
    if &spell
        if a:languaje == "Spanish"
            setlocal spelllang=es
        else
            setlocal spelllang=en_us
        endif

        inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u
        echo "Spell with " . a:languaje . ": ON"
    else
        echo "Spell: OFF"
    endif
endfunction

" mnemonic ['s'pell 's'panish] and ['s'pell 'e'nglish]
nnoremap <leader>ss :call mappings#leader#toggle_spell("Spanish")<CR>
nnoremap <leader>se :call mappings#leader#toggle_spell("English")<CR>

