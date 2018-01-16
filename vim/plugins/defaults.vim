filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim' " Integration for ag
Plugin 'kien/ctrlp.vim' " Fuzzy find files
Plugin 'editorconfig/editorconfig-vim' " Editor config
Plugin 'scrooloose/nerdcommenter' " Commenting
Plugin 'scrooloose/nerdtree' " Browse files and dirs
Plugin 'majutsushi/tagbar' " Browse code
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'bling/vim-airline' " Status line
Plugin 'vim-airline/vim-airline-themes' " Status line themes
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'airblade/vim-gitgutter' " Git line indicator
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'gotcha/vimpdb' " Debugging
Plugin 'beyondwords/vim-twig' " Twig syntax coloring
Plugin 'Valloric/YouCompleteMe' " Autocompletion

if filereadable(glob("~/.vimrc.plugins.local")) 
    source ~/.vimrc.plugins.local
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"/
"/ Airline
"/
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
"/
"/ Editor Config
"/
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"let g:EditorConfig_verbose=1
"/
"/ CrtlP
nmap <Leader>f :CtrlPBufTag<CR>
"/
"/
"/ NERDTree
"/
let NERDTreeIgnore=['\.pyc$']
nmap <Leader>nt :NERDTreeToggle <CR>
"/
"/ VDebug
"/
let g:vdebug_options = {}
"/
"/ Syntastics
"/
let g:syntastic_php_checkers = ['php']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_sort_aggregated_errors = 1
"let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
execute "set colorcolumn=" . join(range(81,335), ',')
"/
"/ YouCompleteMe
"/
" python with virtualenv support
let g:ycm_python_binary_path = $VIRTUAL_ENV . "/bin/python"
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
