#!/bin/bash - 
#===============================================================================
#
#          FILE: rhythmbox-plugins-deletecurrent.sh
# 
#         USAGE: ./rhythmbox-plugins-deletecurrent.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 24-04-2015 02:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -e 
sudo apt-get install python3-xlib
mkdir -p ~/.local/share/rhythmbox/plugins/ 
cd ~/.local/share/rhythmbox/plugins/ 
git clone https://github.com/ppipada/rhythmbox-plugins.git || (cd rhythmbox-plugins && git pull)
cp -rf rhythmbox-plugins/* . -v 

cd ~/.local/share/rhythmbox/plugins/ 
git clone git@github.com:romeuhcf/rhythmbox-copycurrent.git copycurrent || (cd copycurrent && git pull)


