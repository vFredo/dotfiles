"
" Vim autocommands
"

" General configurartions
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
    " Compile files with <leader>c only for tex files
    autocmd FileType tex nnoremap <buffer> <leader>c :VimtexCompile<CR>
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

" Remember folds, only problem files that are created from plugins and temp files
augroup remember_folds_cursor
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
augroup cool_focus
    autocmd!
    autocmd BufEnter,FocusGained,VimEnter,WinEnter * set cursorline
    autocmd FocusLost,WinLeave * set nocursorline
augroup END

