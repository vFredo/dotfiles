"  Reloading .vimrc file
autocmd! bufwritepost .vimrc source %

" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" ------------- Plugin manager configuration (vim-plug) -------------------
call plug#begin('~/.vim/plugged')

Plug 'kaicataldo/material.vim' " Theme of my file config
Plug 'jiangmiao/auto-pairs'    " Autocomplete brackets and parentheses
Plug 'SirVer/ultisnips'        " Useful snippets
Plug 'lervag/vimtex'           " Latex compiler and syntax
Plug 'sheerun/vim-polyglot'    " Syntax highlight
Plug 'tpope/vim-commentary'    " Comment lines more easely

call plug#end()

" --------------------------- Keybindings -------------------------
let mapleader = ","

" Plugin bindings
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>c :VimtexCompile<CR>

" Buffer related bindings
nnoremap <leader>d :bd<CR>
nnoremap <leader>l :ls<CR>:b 
noremap <leader><leader> <C-^>

" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" Requiered for ubuntu (vim-gtk/vim-gnome) or CentOs/Redhat (vim-X11)

" Copy to clipboard (",y") and paste to clipboard(",x")
vnoremap <leader>y "+y
vnoremap <leader>x "+d

" Better navigation between panes
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Move code blocks more easily
vnoremap < <gv
vnoremap > >gv 

" Consistent movement
noremap gh ^
noremap gl $
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" ------------------- Basic Vim configuration ----------------------

" Highlight
set cursorline
syntax enable

" Number configuration
set number          " Set current line number
set relativenumber  " Set relative numbers
set scrolloff=2     " Keep visible the lines below/above the cursor in the window

" Puts vertical windows to right, instead of left and down instead of up
set splitbelow splitright

" Wrap
set fo-=t " Don't automatically text when typing
set backspace=indent,eol,start
set hidden " For have files open without displaying on the screeen (Buffers)
set autoread " When a file is change outside vim, it read it again

" Tabs ('\t') configurations: Soft tabs, 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4    " How much spaces to take when << or >> is used on Normal Mode
set shiftround      " When there are multiple lines and you use < or >
set expandtab

" Search configuration
set hlsearch is " Highlight search and go to the patttern search
set nosmartcase " Don't ignore capital cases when search
autocmd InsertEnter * : setlocal nohlsearch " The hl words are no longer on Insert Mode
autocmd InsertLeave * : setlocal hlsearch " Comes again the hl words on Normal Mode

" Wildmenu configuration
set wildmenu " Making a suggestion menu in searches and autocompletition on Console Mode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store,*.pdf
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Nice looking colors on terminal
if (has("termguicolors"))
    set termguicolors
endif

" ------------------------ Plugins Configurations -----------------------

" ----------------- Material Plugin theme configuration -----------------
set background=dark
let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1
silent! colorscheme material

" --------------------- Ultisnips Plugin configuration ----------------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir="~/Dotfiles/vimSnips"
let g:UltiSnipsSnippetDirectories=[$HOME.'/Dotfiles/vimSnips']

" Edit vertical Ultisnips edition
let g:UltiSnipsEditSplit="vertical"

" --------------------- Vimtex Plugin cofiguration --------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Symbols and special characters view nice or invisible in .tex files
set conceallevel=1
let g:tex_conceal='abdmg'

" Deleting all the temp files that latexmk compiler make
autocmd VimLeave *.tex !latexmk -c %

" --------------------- Polyglot Plugin cofiguration --------------------

" Show i3 config syntax
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Disabled latex syntax (Vimtex take care of it)
let g:polyglot_disabled = ['latex']

