#!/bin/sh
echo "Updating main repo"
cd ~/.vim && git pull
echo ""
echo "Updating vundle"
cd ~/.vim/ && git submodule foreach git pull origin master
echo "Updating plugins"
vim +BundleInstall +qall
