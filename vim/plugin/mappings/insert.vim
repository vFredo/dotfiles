"
" Insert bindings
"

" Create a new figure on inkscape (pip3 install inkscape-figures)
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>

