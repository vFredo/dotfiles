" More information see https://github.com/LukeSmithxyz/vimling
let g:AccentKeysOn=0

function! ToggleAccent()
    if !g:AccentKeysOn
        call AccentOn()
    else
        call AccentOff()
    endif
endfunction

function! AccentOn()
    echo "Accentuation Keys: On"
    let g:AccentKeysOn=1

    " Accents
    imap [a á
    imap [A Á
    imap [e é
    imap [E É
    imap [i í
    imap [I Í
    imap [o ó
    imap [O Ó
    imap [u ú
    imap [U Ú
    imap [<space> [

    " Umlaut
    imap "a ä
    imap "A Ä
    imap "e ë
    imap "E Ë
    imap "i ï
    imap "I Ï
    imap "o ö
    imap "O Ö
    imap "u ü
    imap "U Ü
    imap "<space> "

    " Tilde
    imap ~n ñ
    imap ~N Ñ

endfunction

function! AccentOff()
    echo "Accentuation Keys: Off"
    let g:AccentKeysOn=0

    " Unmapping umlauts
    iunmap "a
    iunmap "A
    iunmap "e
    iunmap "E
    iunmap "i
    iunmap "I
    iunmap "o
    iunmap "O
    iunmap "u
    iunmap "U
    iunmap "<space>

    " Unmapping accent
    iunmap [a
    iunmap [A
    iunmap [e
    iunmap [E
    iunmap [i
    iunmap [I
    iunmap [o
    iunmap [O
    iunmap [u
    iunmap [U
    iunmap [<space>

    " Unmapping tilde
    iunmap ~n
    iunmap ~N

endfunction

