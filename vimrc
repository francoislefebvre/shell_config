let mapleader=','
set timeout timeoutlen=10000

set nocompatible              " be iMproved, required
filetype off                  " required

:nnoremap <Leader>nt :NERDTree <CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Syntax coloring
Plugin 'beyondwords/vim-twig'

" Navigation
Plugin 'kien/ctrlp.vim' " Fuzzy find files
Plugin 'scrooloose/nerdtree' " Browse files and dirs
Plugin 'majutsushi/tagbar' " Browse code

" Edit and move functions
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'

" Version control
Plugin 'tpope/vim-fugitive' " Git
Plugin 'airblade/vim-gitgutter'

" Status line
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Config for syntastic
let g:syntastic_php_checkers = ['php']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Color
set t_Co=256
set background=dark
let &runtimepath.=',~/shell_config/vim'
colors Tomorrow-Night

" Config for airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'

" hide buffer by default
set hidden

set mouse=a

set number

set cursorline

set showcmd

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set list

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

if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
