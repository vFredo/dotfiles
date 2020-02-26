"
" Vim auto commands
"

" General configurations
augroup general_config
    autocmd!
    " Automatic rezise buffers  when resizing window
    autocmd! VimResized * wincmd =
    " Disable auto comments on the next line
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " Disable paste mode on leaving insert mode event
    autocmd InsertLeave * set nopaste
augroup END

" Latex configurations
augroup latex_commands
    autocmd!
    " Deleting all the temp files that latexmk compiler make
    autocmd VimLeave *.tex !latexmk -c %
    " Edit a figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex nnoremap <buffer> <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
    " Create a new figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex inoremap <buffer> <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
augroup END

" https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.vim/plugin/statusline.vim
augroup refresh_statusline
    autocmd!
    autocmd VimEnter * call statusline#update_highlight()
    if exists('##TextChangedI')
        autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter *
                    \ call statusline#check_modified()
    else
        autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter *
                    \ call statusline#check_modified()
    endif
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call statusline#focus_statusline()
    autocmd FocusLost,WinLeave * call statusline#blur_statusline()
augroup END

" Remember folds and cursor pos, the only problem: plugin's files creation ant temp files
augroup automake_view
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

" Better focus with cursorline on and off
augroup cursorline_focus
    autocmd!
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * set cursorline
    autocmd FocusLost,WinLeave * set nocursorline
augroup END

" Depends on the filetype, it can be compiled with 'F5'
augroup compilers_keybinding
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <F5> :!g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o %:r<CR>
    autocmd FileType java nnoremap <buffer> <F5> !javac %<CR>
    autocmd FileType tex nnoremap <buffer> <F5> :VimtexCompile<CR>
augroup END
