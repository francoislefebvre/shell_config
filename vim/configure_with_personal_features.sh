current_dir=$(pwd)
vim_make_dir=$1

sudo apt-get build-dep vim-gnome
sudo apt-get install \
    liblua5.1-dev \
    luajit \
    libluajit-5.1 \
    python-dev \
    ruby-dev \
    libperl-dev \
    libncurses5-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev
cd $vim_make_dir
make distclean
./configure --with-features=huge \
            --enable-fail-if-missing \
            --enable-gui=auto \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope \
            --prefix=/usr
make
sudo make install
#sudo cp src/vim ~/bin/vim
#sudo update-alternatives --install /usr/bin/vim vim ~/bin/vim 70
cd $current_dir
