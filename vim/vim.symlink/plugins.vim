filetype off

" set rtp+=~/.vim/bundle/vundle/
call plug#begin('~/.vim/plugged')

" let vundle manage vundle
" Plugin 'gmarik/vundle'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
"Plug 'kevinw/pyflakes-vim'
Plug 'vim-scripts/Smart-Tabs'
Plug 'benmills/vimux'
Plug 'tpope/vim-commentary'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'yueyoum/vim-linemovement'
Plug 'hynek/vim-python-pep8-indent'
Plug 'majutsushi/tagbar'
Plug 'geoffharcourt/one-dark.vim'

" Better starting screen
Plug 'mhinz/vim-startify'

Plug 'sickill/vim-pasta' " context-aware pasting
" Syntax hilighting for less
" TODO this stuff takes FOREVER to startup
" Plug 'scooloose/nerdtree'
" Plug 'groenewege/vim-less'
" Plug 'skammer/vim-css-color'
" Plug 'hail2u/vim-css3-syntax'

" Session manager
Plug 'xolox/vim-session'

" Vim notes
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Used for javascript stuff
" Plug 'marijnh/tern_for_vim'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'pangloss/vim-javascript'
" Plug 'nathanaelkane/vim-indent-guides'

" Used for HTML/CSS
" Plug 'mattn/emmet-vim'
call plug#end()
filetype Plug indent on
