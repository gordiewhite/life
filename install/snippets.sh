#!/bin/bash

echo "adding my custom snippets to the correct directory"

SNIPPETS_PATH=$HOME/.vim/plugged/vim-snippets/snippets
ULTISNIPS_PATH=$SNIPPETS_PATH/UltiSnips

cp snippets/c.snippets $SNIPPETS_PATH
cp snippets/c_ulti.snippets $ULTISNIPS_PATH

echo "snippets have been installed!"


