#!/bin/bash
mkdir -p ~/.vim/bundle ~/.vimswap ~/.vimundo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
