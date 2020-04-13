"
" Normal bindings
"

" Vinegar like toggle for NERDTree
nnoremap <silent> - :NERDTreeToggle<CR>

" Change what selected on '*' command (if you want to change a word in multiple lines)
" press 'n' then '.' after the first iteration. (mnemonic of 'c'hange)
nnoremap c* *Ncgn

" Consistent movement
noremap gh ^
noremap gl $
" Move between wrapped lines unless I had a count ex. 10j
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Toggle folds (if not possible use the default behavior of <tab>)
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>

" Cursor keys for jumps in the quickfix list
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>


