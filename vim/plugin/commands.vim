"
" Vim commands or autocommands
"

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

augroup mips_yntax
    autocmd!
    autocmd BufNewFile,BufRead *.s set syntax=mips
augroup END

" Disable auto comments on the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup latex_bindings_commands
    autocmd!
    " Deleting all the temp files that latexmk compiler make
    autocmd VimLeave *.tex !latexmk -c %
    " Compile files with <leader> c only for couple of files
    autocmd FileType tex nnoremap <buffer> <leader>c :VimtexCompile<CR>
    " Edit a figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex nnoremap <buffer> <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
    " Create a new figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex inoremap <buffer> <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
augroup END

augroup flutter_bindings
    autocmd!
    " Bindings only for dart files
    autocmd FileType dart nnoremap <buffer> <leader>r :FlutterRun<CR>
    autocmd FileType dart nnoremap <buffer> <leader>R :FlutterHotRestart<CR>
    autocmd FileType dart nnoremap <buffer> <leader>q :FlutterQuit<CR>
    autocmd FileType dart nnoremap <buffer> <leader>e :FlutterHotReload<CR>
augroup END

