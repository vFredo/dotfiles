"
" Vim commands or autocommands
"

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" Mips syntax
autocmd BufNewFile,BufRead *.s set syntax=mips

" Disable auto comments on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Deleting all the temp files that latexmk compiler make
autocmd VimLeave *.tex !latexmk -c %

" Fixing anoying problem of lightline lost focus and show inactive statusline when is not.
autocmd BufWinEnter,WinEnter * call lightline#enable()

" Compile files with <leader> c only for couple of files
autocmd FileType tex nnoremap <buffer> <leader>c :VimtexCompile<CR>

" Edit a figure on inkscape (pip3 install inkscape-figures) for latex
autocmd Filetype tex nnoremap <buffer> <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Create a new figure on inkscape (pip3 install inkscape-figures) for latex
autocmd Filetype tex inoremap <buffer> <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>

