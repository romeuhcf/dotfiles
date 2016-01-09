#!/bin/bash
sudo apt-get install -y git
EMAIL="$(zenity --entry --text 'Digite seu EMAIL para configuracao do GIT')"
NOME="$(zenity --entry --text 'Digite seu NOME para configuracao do GIT')"
git config --global user.email "$EMAIL"
git config --global user.name "$NOME"
