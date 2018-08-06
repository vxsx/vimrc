#!/bin/sh
echo "Updating main repo"
cd ~/.vim && git pull
echo ""
echo "Updating plugins"
vim +PlugInstall +qall
