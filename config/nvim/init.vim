" set rtp+=~/.vim/bundle/vundle/
call plug#begin('~/.vim/plugged')

" let vundle manage vundle
" Plugin 'gmarik/vundle'

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
Plug 'Valloric/YouCompleteMe' " useful for vim autocomplete
Plug 'ryanoasis/vim-devicons'
" Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'benmills/vimux'
Plug 'tpope/vim-commentary'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
" python plugins to meed standards
Plug 'hynek/vim-python-pep8-indent'
" use :setfiletype django to prevent ultisnips from erroring on django templates
Plug 'vim-scripts/django.vim'
Plug 'majutsushi/tagbar'
" Plug 'simplyzhao/cscope_maps.vim'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'xolox/vim-notes'

" Better starting screen
Plug 'mhinz/vim-startify'

Plug 'sickill/vim-pasta' " context-aware pasting

" " Session manager
" Plug 'xolox/vim-session'

" Used for HTML/CSS
" Plug 'mattn/emmet-vim'
call plug#end()

" Package Configuration {{{
" {{{ CtrlP
	let g:ctrlp_map='<leader>p'
	let g:ctrlp_working_path_mode='ra'
	" CtrlP ignore patterns
	let g:ctrlp_custom_ignore = {
				\ 'dir': '\.git$\|node_modules$\|bower_components$\|\.hg$\|\.svn$',
				\ 'file': '\.exe$\|\.so$|\.out$'
				\ }
	" only show files that are not ignored by git
	let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

	" search the nearest ancestor that contains .git, .hg, .svn
	let g:ctrlp_working_path_mode = 2
" }}}
" {{{ NERDTree
	" close NERDTree after a file is opened
	let g:NERDTreeQuitOnOpen=0
	" show hidden files
	let NERDTreeShowHidden=1
	let g:NERDTreeDirArrows=1
	let g:NERDTreeDirArrowExpandable='▸'
	let g:NERDTreeDirArrowCollapsible='▾'
	" set NERDTree toggle
	map <leader>nt :NERDTreeToggle<CR>
	" expand to the path of the file in the current buffer
	map <leader>y :NERDTreeFind<CR>
" }}}
"	linemovement {{{
		" let g:linemovement_up="<A-Up>"
		" let g:linemovement_down="<A-Down>"
"	}}}
"   {{{ Deoplete
		let g:deoplete#enable_at_startup=1
"   }}}
"	YouCompleteMe {{{
        let g:ycm_autoclose_preview_window_after_completion=1

        " Must press ctrl and an arrow key to move up and down completion
        " list
        let g:ycm_key_list_select_completion=['<C-n>', '<C-Down>']
        let g:ycm_key_list_previous_completion=['<C-p>', '<C_Up>']

		let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
		let g:ycm_show_diagnostics_ui = 0
		"let g:ycm_auto_trigger = 0
"	}}}
"   Syntastic {{{
        let g:syntastic_mode_map={'mode':'active','active_filetypes':[],'passive_filetypes':[]}
		let g:syntastic_error_symbol='✗'
		let g:syntastic_warning_symbol='⚠'
"   }}}
"	ultisnips {{{
		let g:UltiSnipsExpandTrigger = "<tab>"
		let g:UltiSnipsJumpForwardTrigger = "<tab>"
		let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
		let g:UltiSnipsSnippetDirectories = ["UltiSnips", "~/.dotfiles/config/nvim/UltiSnips"]
"	}}}
"   Airline (better status bar) {{{
		let g:airline#extensions#tabline#enabled = 2
		let g:airline#extensions#tabline#fnamemod = ':t'
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		let g:airline#extensions#tabline#right_sep = ' '
		let g:airline#extensions#tabline#right_alt_sep = '|'
		let g:airline_left_sep = ' '
		let g:airline_left_alt_sep = '|'
		let g:airline_right_sep = ' '
		let g:airline_right_alt_sep = '|'
		let g:airline_theme= 'base16'
		let g:airline_left_sep=''
		let g:airline_powerline_fonts = 1
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		let g:airline_symbols.space="\ua0"
"   }}}
"	Notes {{{
		let g:notes_directories = ['~/Documents/Notes']
"	}}}
"	Session {{{
		let g:session_directory = '~/.vim/sessions'
		let g:session_autosave='no'
		let g:session_autoload='no'
"	}}}
"	Startify {{{
		let g:startify_session_dir = "~/.vim/sessions"
		"let g:startify_list_order = ['sessions', 'bookmarks', 'dir', 'files']
		let g:startify_list_order = [
			\ ['My Sessions:'], 'sessions',
			\ ['My Bookmarks:'], 'bookmarks',
			\ ['Most Recently Used Files:'], 'files']
		let g:startify_bookmarks = ['~/.vimrc']
		let g:startify_custom_header = [
			\ '  Always code as if the guy who ends up maintaining your code',
			\ '  will be a violent psychopath who knows where you live.',
			\ '							- Rick Osbourne',
			\ '',
			\ '']
"	}}}
" {{{ vimwiki

		let g:vimwiki_list = [{'path': '~/git/brycearden.github.io/_posts',
					\ 'syntax' : 'markdown','ext' : '.md' }]
					" \ 'path_html': '~/Documents/vimwiki_html/'}]

		let g:vimwiki_table_mappings = 0
		" let g:vimwiki_global_ext=0
		" let g:vimwiki_ext2syntax={}
		" vim thinks all markdown files are .mkd
		autocmd BufNewFile,BufReadPost *.md set filetype=markdown
		augroup filetypedetect
			au! BufRead,BufNewFile */vimwiki/*        set filetype=vimwiki
		augroup END
" }}}
" Multiple Cursors {{{
	" Default mapping
	let g:multi_cursor_next_key='<leader>n'
	let g:multi_cursor_prev_key='<leader>N'
	let g:multi_cursor_skip_key='<leader>x'
	let g:multi_cursor_quit_key='<Esc>'
" }}}
" Ctags {{{
"   Recursively search up to home directory for tags files
    set tags=./tags;~/code
" }}}
" }}}

" General {{{
filetype plugin on	" Allows use of filetype plugins
set encoding=utf-8	" Sets encoding to utf-8
let mapleader=","	" Changes leader key from \ to ,
" set autochdir		" automatically sets the cwd to the file being edited
set magic "Set magic on for regex

" Makes it easier to use 'O' without waiting
"set timeout timeoutlen=1000 ttimeoutlen=100
set noesckeys		" Means you can't use escape keys in insert mode (but I don't need them)

" Doesn't default to plaintex
let g:tex_flavor = "latex"
" }}}

" Colors {{{
syntax enable
" set the colorscheme
let g:base16_shell_path='base16-builder/output/gnome-terminal'
let base16colorspace="256"
set t_Co=256
" set background=dark
" colorscheme base16-eighties
" let g:base16_shell_path=.doftiles/.config/base16-builder/output/shell/
" let base16colorspace="256" " Access colors present in 256 colorspace
" set t_Co=256

" colorscheme baycomb  " set default colorscheme
" colorscheme wombat256mod " set default colorscheme
" set background=dark " set background to dark

execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME

if (has("gui_running"))
    set guioptions=egmrt
    set background=light
    colorscheme solarized
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_powerline_fonts=0
    let g:airline_theme='solarized'
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
 set t_ut=
endif
" }}}

" Spaces and Tabs {{{
filetype indent on	" load filetype-specific indent files
" set shiftwidth=4	" Number of spaces for auto indenting also effects reindent operations (<< and >>)
set shiftwidth=4	" Number of spaces for auto indenting also effects reindent operations (<< and >>)
set tabstop=4		" A tab is 4 spaces"
set expandtab		" Whenever a tab is pressed, insert spaces instead
" set softtabstop=4	" number of spaces in tab when editing
set softtabstop=4	" number of spaces in tab when editing
set smarttab		" insert tabs on the start of a line according to
					"    shiftwidth, not tab stop
set autoindent		" turns on auto indentions
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:& " set the listchars to be used for set list
" }}}

" UI Config {{{
set wrap			" Lines wrap
set shell=$SHELL
set cmdheight=1
set linebreak		" only wrap at a character in breakat
set number
set relativenumber
set nolist			" list diables linebreak
set textwidth=0		" Don't insert linebreaks for wrap
set wrapmargin=0	" Don't insert linebreaks for wrap
set mouse=a			" Can use mouse for most actions
set pastetoggle=<F2> " Allow toggling paste mode with F2
set hidden			" Buffers become hidden when abandoned
set laststatus=2	" Always show status bar
set showcmd 		" shows command in bottom right
set wildmenu		" visual autocomplete for command menu
set wildmode=list:longest " complete files like a shell
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o " ignore some files in wild menu
" set lazyredraw		" only redraws when it needs to */
set showmatch		" highlight matching [{()}]
set backspace=2 	" can backspace through anything
set autoread		" automatically updates file that has been changed outside of buffer
set scrolloff=2		" Always shows at least 2 lines of context when scrolling

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Remember info about open buffers on close
set viminfo^=%
" }}}

" Searching {{{
set incsearch		" searches file as you type
set ignorecase
set smartcase		" search is case insensitive if in all lowercase
set hlsearch

" searches for whatever is selected in visual mode
vnoremap <silent> * :call VisualSelection('f')<CR>
" }}}

" Folding {{{
" If you have trouble with syntax highlighting try <Ctrl-l>
set foldenable			" enable folding
set foldlevelstart=10	" open most folds by default
set foldnestmax=10		" 10 nested fold max
set foldmethod=indent

" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* if (expand("<afile>")) != "config.py" | silent loadview | endif
" TODO set a folding method for different filetypes using autocmds
" }}}

" Autogroups {{{

augroup allgroup
	autocmd!
	autocmd BufWritePre * :call DeleteTrailingWS()
	autocmd BufEnter * AirlineRefresh
	" autocmd BufEnter * :lchdir %:p:h

	" Return to last edit position when opening files
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	exe "normal! g`\"" |
		\ endif
augroup END

augroup configgroup
	autocmd!
	autocmd BufWritePost .vimrc source %   " Automatically reload config file when saved
	autocmd BufWritePost .vimrc set foldmethod=marker
augroup END

" Add a custom filetype for testing
au BufNewFile,BufRead *.pn set filetype=potion
" }}}

" Custom Functions {{{

" recursively search up from dirname, sourcing all .vimrc.local files along the way
function! ApplyLocalSettings(dirname)
    " convert windows paths to unix style
    let l:curDir = substitute(a:dirname, '\\', '/', 'g')

    " walk to the top of the dir tree
    let l:parentDir = strpart(l:curDir, 0, strridx(l:curDir, '/'))
    if isdirectory(l:parentDir)
        call ApplyLocalSettings(l:parentDir)
    endif

    " now walk back down the path and source .vimsettings as you find them.
    " child directories can inherit from their parents
    let l:settingsFile = a:dirname . '/.vimrc.local'
    if filereadable(l:settingsFile)
        exec ':source' . l:settingsFile
    endif
endfunction

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" function! LoadCscope()
"   let db = findfile("cscope.out", ".;")
"   if (!empty(db))
"     let path = strpart(db, 0, match(db, "/cscope.out$"))
"     set nocscopeverbose " suppress 'duplicate connection' error
"     exe "cs add " . db . " " . path
"     set cscopeverbose
"   endif
" endfunction
" au BufEnter /* call LoadCscope()

function! DoubleSpaces()
    exec ':%s/^\(\(  \)\+\)/\1\1'
endfunc
" toggle between number and relativenumber and no number
function! ToggleNumber()
	if !exists("b:number_status")
		let b:number_status = 1
	endif

	if (b:number_status == 1)
		set norelativenumber
		set nonu
		let b:number_status = 2
	elseif (b:number_status == 2)
		set norelativenumber
		set number
		let b:number_status = 3
	else
		set relativenumber
		let b:number_status = 1
	endif

endfunc

function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction

"slow multiple_cursors &amp; YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" }}}

" General Key Mappings {{{

" Toggle Tagbar
nmap T :TagbarToggle<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" smart way to rezise windows
" nnoremap <C-H> :vertical resize -5<cr>
" nnoremap <C-J> :resize +5<cr>
" nnoremap <C-K> :resize -5<cr>
" nnoremap <C-L> :vertical resize +5<cr>

" easier commands to open splits, keeps things similar to tmux
" nnoremap <leader>- :sp
" nnoremap <leader>| :vsp

" map esc to jk
inoremap jk <esc>
" move vertically by visual line not real line
nnoremap j gj
nnoremap k gk
nnoremap <End> g<End>
nnoremap <Home> g<Home>
imap <End> <C-o>g<End>
imap <Home> <C-o>g<Home>

" Arrow keys are for wimps
" nnoremap <Down> <nop>
" nnoremap <Up> <nop>
" nnoremap <Left> <nop>
" nnoremap <right> <nop>
" imap <Down> <nop>
" imap <Up> <nop>
" imap <Left> <nop>
" imap <right> <nop>

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" highlight last inserted text
nnoremap gV `[v`]

" maps space to open and close folds
nnoremap <space> za

" Allow using ctl + arrow up or down to move between folds
nmap <silent>fj zj
nmap <silent>fk zk

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Abbreviation for the time and date
iab xdate <C-r>=strftime("%c")<CR>

" Key mappings for Line dividers
imap ;ld= ==============================================================================================
imap ;ld- ----------------------------------------------------------------------------------------------
imap ;ld* **********************************************************************************************

" Template key mappings
"imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
nmap <buffer> ;; /%%%<CR>c3l

imap <buffer> ;pycls <C-O>mzclass %%%(%%%):<CR>'''<CR>%%%<CR>'''<CR><CR>def __init__(self, %%%):<CR>%%%<C-O>'z;;
imap <buffer> ;pyhead <C-O>mz#!/usr/bin/python<CR># -*- encoding: utf-8 -*-<CR>"""<CR>Created on xdate<CR><CR>%%%<CR><CR>@author: klemons<CR>"""<CR><CR>from sys import path<CR>path.append("../Linux-x86_64-swig")<CR><C-O>'z;;
imap <buffer> ;pyfunc <C-O>mzdef %%%(%%%):<CR>'''<CR>%%%<CR>'''<CR><CR>%%%<C-O>'z;;

" }}}

" Leader Key Mappings {{{

" turn off seach highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" edit vimrx/bashrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Key-mappings to turn YouCompleteMe on and off
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" change tabs with ,tn and ,tm
nnoremap <leader>tn :tabp<CR>
nnoremap <leader>tm :tabp<CR>

" change buffers with ,k and ,j
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>

" Close the current buffer
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" change spacing and indendation
nnoremap <leader>2s :call DoubleSpaces()<CR>

" Toggle preferences
nnoremap <leader>c :call ToggleNumber()<CR>
nnoremap <leader>sx :SyntasticToggleMode<CR>
nnoremap <leader>z :set list!<CR>

" Spell check stuff
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>se z=

" silver searcher
nnoremap <leader>a :Ag

" shortcut to open NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Quick save command
nnoremap <leader>w :call DeleteTrailingWS()<CR>:write<CR>

" Quick quit command
nnoremap <leader>q :quit<CR>

" Search and replace with <leader>r
vnoremap <silent><leader>r :call VisualSelection('replace')<CR>

" 'super save' saves an assortment of windows that can be reopened with vim -S
nnoremap <leader>ms :SaveSession<CR>
" }}}

" Last 5 lines are modelines
set modelines=5
" vim:foldmethod=marker:foldlevel=0
call ApplyLocalSettings(expand('.'))
