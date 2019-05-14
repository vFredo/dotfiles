" Reloading .vimrc file
autocmd! bufwritepost .vimrc source %
" Automatic rezise buffers  when resizing window
autocmd! VimResized * wincmd =

" ------------- Plug configuration -------------------
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'        " Theme of my file config
Plug 'jiangmiao/auto-pairs'   " Autocomplete brackets and pharenthesis
Plug 'scrooloose/nerdtree'    " File manager for vim
Plug 'SirVer/ultisnips'       " Useful snippets
Plug 'lervag/vimtex'          " Latex compiler and syntax
Plug 'tpope/vim-commentary'   " Comment lines more easely
Plug 'sheerun/vim-polyglot'   " Multiple syntaxis for languages

call plug#end()

" ------------------- Keybindings -------------------
let mapleader = ","

" Plugin bindings
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>c :VimtexCompile<CR>

" Change between buffers
nnoremap <leader>d :bd<CR>
nnoremap <leader>l :ls<CR>:b 

" Check if is need it to install: vim --version | grep clipboard 
" (+clipboard or +xterm_clipboard has to appear, otherwise install dependency)
" Requiered for ubuntu(vim-gtk/vim-gnome) or CentOs/Redhat(vim-X11)

" Copy to clipboard (",y") and paste to clipboard(",x")
vnoremap <leader>y "+y
vnoremap <leader>x "+d

" Better navigation between panes
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"Move code blocks more easily
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" ------------------- Basic vim configuration ----------------------

" Title configuration
" Set title of the current buffer
" autocmd BufEnter * let &titlestring = expand("%:@")
" set title " Title of the current file working
" set titleold= " Set last little to the current screen when is not in vim

" Number Line
set number          " Set current line number
set relativenumber  " Set relative numbers
set scrolloff=2     " Keep visible the lines below/above the cursor in the window

" Syntax highlighting
set cursorline
syntax enable

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
set smartcase " Don't ignore capital case when searh
autocmd InsertEnter * : setlocal nohlsearch " The hl words are no longer on Insert Mode
autocmd InsertLeave * : setlocal hlsearch " Comes again the hl words on Normal Mode

" Wildmenu configuration
set wildmenu " Makig a suggestion menu in searches and autocompletition in :menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.DS_Store,*.pdf
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.class

" Making transitions between modes more fast
set timeoutlen=1000 ttimeoutlen=5

" Nice looking colors on terminal
if (has("termguicolors"))
    set termguicolors
endif

" ---------------------- Plugins Configurations -----------------------

" ---------------- NERDTree Plugin configurations ----------------------
let NERDTreeShowHidden=1

" ----------------- Nord Plugin theme configuration -----------------
set background=dark
let g:gruvbox_italic=1
silent! colorscheme gruvbox

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

" Deliting all the temp files that make the compiler latexmk
autocmd VimLeave *.tex !latexmk -c %

" --------------------- Polyglot Plugin cofiguration --------------------

" Show i3 syntax
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Disabled latex syntax (Vimtex take care of it)
let g:polyglot_disabled = ['latex']

