" Leader options --------------------------------

let mapleader=','
set timeout timeoutlen=10000

" Get latest Vim settings/options

set nocompatible

" Plugins ---------------------------------------

source ~/shell_config/vim/plugins.vim

" Mappings ------------------------------------

"--- Nerd Tree Toggle ---
nmap <Leader>nt :NERDTreeToggle <CR>

"--- Window navigation ---
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k

"--- Search tags ---
" sudo apt-get install ctags
nmap <Leader>f :CtrlPBufTag<CR>

"--- Simple highlight removal ---
nmap <Leader><space> :set nohlsearch<cr>

"--- Open buffer in split ---
nmap <Leader>so :vert sb<space>

" Auto-commands ---------------------------------

" Automatically source .vimrc on save
augroup autosourcing
    " Conflicts with other plugins
    "autocmd!
    "autocmd BufWritePost .vimrc source %
augroup END

" VIM options -----------------------------------

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
let &runtimepath.=',~/shell_config/vim'
colors Tomorrow-Night

" Status line
set laststatus=2
let g:airline_powerline_fonts = 1
    let g:airline_theme = 'tomorrow'

set hidden
set mouse=a
set number
set cursorline
set showcmd

"/
"/ Tabulation and invisibles
"/
filetype plugin indent on
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

" Plugins options -------------------------------

"/
"/ Syntastic
"/
let g:syntastic_php_checkers = ['php']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"/
"/ Editor Config
"/
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

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


