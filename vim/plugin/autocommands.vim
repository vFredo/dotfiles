"
" Vim auto commands
"

let g:mkviewFiletypeBlacklist = ['diff', 'hgcommit', 'gitcommit', '.fzf']

" General configurations
augroup general_config
    autocmd!
    " Automatic rezise buffers  when resizing window
    autocmd! VimResized * wincmd =
    " Disable auto comments on the next line
    autocmd FileType *
                \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " Disable paste mode on leaving insert mode event
    autocmd InsertLeave * set nopaste

augroup END

" Latex configurations
augroup latex_commands
    autocmd!
    " Deleting all the temp files that latexmk compiler make and close zathura
    autocmd User VimtexEventQuit call CloseViewers() | !latexmk -c %
    " Edit a figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex nnoremap <buffer> <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
    " Create a new figure on inkscape (pip3 install inkscape-figures) for latex
    autocmd Filetype tex inoremap <buffer> <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
    " Don't scan the file is very slow
    autocmd Filetype tex setlocal complete-=i

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

" Remember folds and cursor position.
function! autocommands#should_mkview() abort
  return
        \ &buftype ==# '' &&
        \ index(g:mkviewFiletypeBlacklist, &filetype) == -1 &&
        \ !exists('$SUDO_USER') " Don't create root-owned files.
endfunction

function! autocommands#mkview() abort
  try
    if exists('*haslocaldir') && haslocaldir()
      " We never want to save an :lcd command, so hack around it...
      cd -
      mkview
      lcd -
    else
      mkview
    endif
  catch /\<E186\>/
    " No previous directory: probably a `git` operation.
  catch /\<E190\>/
    " Could be name or path length exceeding NAME_MAX or PATH_MAX.
  endtry
endfunction

augroup automake_view
    autocmd!
    autocmd BufWritePost,BufLeave,WinLeave ?* if autocommands#should_mkview() | call autocommands#mkview() | endif
    autocmd BufWinEnter ?* if autocommands#should_mkview() | silent! loadview | endif
augroup END

" Better focus
augroup focus_window
    autocmd!
    if exists('+winhighlight')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
        autocmd FocusLost,WinLeave * set winhighlight=CursorLineNr:LineNr,EndOfBuffer:ColorColumn,IncSearch:ColorColumn,Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn
    else
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline
        autocmd FocusLost,WinLeave * setlocal nocursorline
    endif
augroup END

" Depends on the filetype, it can be compiled with 'F5'
augroup compilers_keybinding
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <F5> :!g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o run<CR>
    autocmd FileType cpp nnoremap <buffer> <F6> :!./run<CR>
    autocmd FileType java nnoremap <buffer> <F5> !javac % && java -enableassertions %:r<CR>
    autocmd FileType tex nnoremap <buffer> <F5> :VimtexCompile<CR>
augroup END

