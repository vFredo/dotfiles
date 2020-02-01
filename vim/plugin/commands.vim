"
" Vim commands or autocommands
"

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" Mips syntax
autocmd BufNewFile,BufRead *.s set syntax=mips

" Disable auto comments on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

 " Remember folds when quit a file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Deleting all the temp files that latexmk compiler make
autocmd VimLeave *.tex !latexmk -c %

" Fixing anoying problem of lightline lost focus and show inactive statusline when is not.
autocmd BufWinEnter,WinEnter * call lightline#enable()

" Compile files with <leader> c only for couple of files
autocmd FileType tex nnoremap <buffer> <leader>c :VimtexCompile<CR>

