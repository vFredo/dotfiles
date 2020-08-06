"
" Visual bindings
"

" Move between windows
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

" Move between wrapped lines unless I had a count ex. 10j
xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Move code blocks more easily
vnoremap < <gv
vnoremap > >gv

