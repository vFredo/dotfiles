"
" Normal bindings
"

" Some miscellaneous bindings
nnoremap c* *Ncgn
nnoremap <Up> <C-y>M
nnoremap <Down> <C-e>M

" Consistent movement
noremap gh ^
noremap gl $
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Toggle between folds
nnoremap <Tab> za

" Edit a figure on inkscape (pip3 install inkscape-figures)
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

