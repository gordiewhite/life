#!/bin/bash

echo "adding my custom snippets to the correct directory"

SNIPPETS_PATH=$HOME/.vim/plugged/vim-snippets/snippets
ULTISNIPS_PATH=$HOME/.vim/plugged/vim-snippets/UltiSnips

cp snippets/c.snippets $SNIPPETS_PATH
cp snippets/c_ulti.snippets $ULTISNIPS_PATH/c.snippets

echo "snippets have been installed!"


