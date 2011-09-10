#!/bin/sh
echo "Updating main repo"
cd ~/.vim && git pull
echo ""
echo "Updating plugins"
cd ~/.vim/ && git submodule foreach git pull origin master
