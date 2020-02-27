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
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Toggle folds (if not possible use the default behavior of <tab>)
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>

" Cursor keys works to jump in quicklistfix
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" Remember realive line number jumps if they exceed a threshold '5'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

