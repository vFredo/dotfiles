"
" Vim commands or autocommands
"

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" Mips syntax
autocmd BufNewFile,BufRead *.s set syntax=mips

