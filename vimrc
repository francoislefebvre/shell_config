" Leader options --------------------------------

let mapleader=','
set timeout timeoutlen=10000

" Plugins ---------------------------------------

set nocompatible
source $SHELL_CONFIG_PATH/vim/plugins/defaults.vim
filetype plugin indent on
syntax on

" Mappings ------------------------------------

"--- Window navigation ---
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k

"--- Simple highlight removal ---
nmap <Leader><space> :set nohlsearch<cr>

"--- Open buffer in split ---
nmap <Leader>so :vert sb<space>

"--- Close buffer without closing the window ---
nmap <C-W>! <Plug>Kwbd

" Auto-commands ---------------------------------

" Automatically source .vimrc on save
augroup autosourcing
    " Conflicts with other plugins
    "autocmd!
    "autocmd BufWritePost .vimrc source %
augroup END


"/
"/ Splits
"/
set splitbelow
set splitright

"/
"/ Searches
"/
set hlsearch
set incsearch

"/
"/ Visual
"/
" Colors
set t_Co=256
set background=dark
let &runtimepath.="," . $SHELL_CONFIG_PATH . "/vim"
colors Tomorrow-Night

" Status line
set laststatus=2

set hidden
set mouse=a
set number
set cursorline
set showcmd

"/
"/ Tabulation and invisibles
"/
set tabstop=4
set shiftwidth=4
set expandtab

set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set list

"/
"/ History
"/
set backupdir=~/.vimswap
set directory=~/.vimswap

set undofile
set undodir=~/.vimundo

" Restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Python config
"au BufNewFile,BufRead *.py set textwidth=79 fileformat=unix

"
" Source local settings -------------------------

if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

" Enable omni completion (necessary for valloric/youcompleteme)
:
"set omnifunc=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Tips ------------------------------------------
"
" Search and Replace
" For search and replace in multiple files,
" install skwp/greplace.vim
"
" Ctags
" ctags : run in ctags -R in a folder
" This creates a "tags" folder that might
" need to be replaced.
"
" Snippets
" To use snippets, use snipmate plugin
"
" Surroundings
" tpope/vim-surround
"


