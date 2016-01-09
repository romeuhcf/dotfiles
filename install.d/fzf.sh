#!/bin/bash - 
set -e 
test -d ~/.fzf || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

