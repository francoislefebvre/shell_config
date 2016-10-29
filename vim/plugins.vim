filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autocompletion
Plugin 'ervandew/supertab'

" Syntax checking
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'

" Syntax coloring
Plugin 'beyondwords/vim-twig'

" Navigation
Plugin 'kien/ctrlp.vim' " Fuzzy find files
Plugin 'scrooloose/nerdtree' " Browse files and dirs
Plugin 'majutsushi/tagbar' " Browse code
Plugin 'rking/ag.vim' " Integration for ag

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
filetype plugin indent on    " required"
