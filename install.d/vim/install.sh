#!/bin/bash

function install_os_dependencies(){
for pkg in exuberant-ctags ncurses-term ack-grep silversearcher-ag vim
do
  dpkg -s $pkg &>/dev/null || sudo apt-get install -y $pkg
done
}

function install_pathogen(){
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
}

function install_molokai(){
if [ ! -f ~/.vim/colors/molokai.vim ]; then
  mkdir -p  ~/.vim/colors
  curl -LSso ~/.vim/colors/molokai.vim https://raw.github.com/tomasr/molokai/master/colors/molokai.vim
fi
}

function install_pathogen_modules_from_github(){
cat modules_list | while read module
do
  install_pathogen_module_from_github $module
done
}

function install_fonts(){
if [ ! -d ~/.fonts/ ]; then
  mkdir ~/.fonts
  if [ ! -f ~/.fonts/PowerlineSymbols.otf ]; then
    wget "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
    mv PowerlineSymbols.otf ~/.fonts/
  fi
fi

if [ ! -d ~/.config/fontconfig/conf.d/ ]; then
  mkdir -p ~/.config/fontconfig/conf.d/
  if [ ! -f ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ]; then
    wget "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
  fi
fi
}

function install_pathogen_module_from_github(){
repo=$1
author=$(dirname $repo)
module=$(basename $repo)
if [ ! -d  ~/.vim/bundle/$module ];then
  git clone  https://github.com/$author/$module ~/.vim/bundle/$module
fi
}

install_os_dependencies
install_pathogen
install_fonts
install_pathogen_modules_from_github

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp

cp vimrc -v ~/.vimrc
cp *.vim -v ~/.vim
