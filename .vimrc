" Vim Config File(saved in ~/.vimrc)
" Created by Haipeng Li

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do not show the prompt to assist Ugandan children when starting
set shortmess=atI

" - > global settings < -
" disable the vi compatibility mode
set nocompatible
" the steps of history
set history=1000
" detect file type
filetype on
" load plugin according file type
filetype plugin on
" load indent file according file type 
filetype indent on
" auto read when the file has been changed
set autoread
" auto saved when the file has been changed
set autowrite
" enable mouse use
set mouse=a
set selection=exclusive
" set selectmode=mouse, key
" save global variables
set viminfo+=!
" no line feed if words contain following symbols
set iskeyword+=_,$,@,%,#,-
" marked the modified lines by using ': commands' command
set report=0
" space appears between split windows
set fillchars=vert:\ ,stl:\ ,stlnc:\

" - > font and color settings < -
" enable syntax highlighting
syntax enable
" font
" set guifont=dejaVu\ Sans\ MONO\ 10
set guifont=Courier_New:h10:cANSI
" color
colorscheme desert
" highlight current line
set cursorline
hi cursorline guibg=#00ff00
hi CursorColumn guibg=#00ff00
" highlight common txt file
au BufRead, BufNewFile * setfiletype txt

" - > code folding setting < -
" enable folding 
set foldenable " set nofen (disable folding)
" folding mode(manual, indent, expr, syntax, diff, marker)
set foldmethod=indent " set fdl=0 (no folding)
" width of folding area, a folded identifier appears on the left if not 0
set foldcolumn=0
" set folded layer
" setlocal foldlevel=3
" set the fold to automatically close
set foldclose=all

" - > word processing < -
" width of tab-key
set tabstop=4
" moving width when using command <>
set shiftwidth=4
" allow to delete 4 spaces at a time when press backspace-key
set softtabstop=4
set smarttab
" auto indent (inherit previous line)
set autoindent
set smartindent
" auto wrap
set wrap
" inline substitution
set gdefault
" smart case
set smartcase

" - > vim screen setting < -
" show optional command menu
set wildmenu
" display scale
set ruler
" set height of the command line
set cmdheight=1
" display the entered command
set showcmd
" display line number
set number
" character by character highlight when search
set hlsearch
set incsearch
" ignore case when search
set ignorecase
" disable graphic button
set go=
" highlight current line with a light color
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" normal processing indent, eol, start et. using backspace-key
set backspace=eol,start,indent
" allow space-key and cursor to span the line edge
set whichwrap+=<,>,h,l
" set magic
set magic
" colse the error message sound prompt
set noerrorbells
set novisualbell
" highlight display matched parenthesis
set showmatch
" time of highlight matched bracket
set matchtime=1
" keep 3 lines apart when cursor moves to the top/bottom of the buffer
set scrolloff=3

" - > encode setting < -
" set encoding
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" set file encoding
set fileencodings=utf-8
" set terminal encoding
set termencoding=utf-8
" set language encoding
set langmenu=zh_CN.UTF-8
set helplang=cn

" - > other setting < -
" display confirmation when processing read-only or unsaved files
set confirm
" display status bar
set laststatus=2
" content displayed in status bar
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set background color
set background=dark
" automatic file type detection and intelligent code completion
set completeopt=longest,preview,menu
" never backuo
set nobackup
set noswapfile
set nowritebackup
" hidden tool bar
set guioptions-=T
" hidden menu bar
set guioptions-=m
" share clipper
set clipboard+=unnamed
" display chinese help
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" set the related items highlighted
highlight Search ctermbg=black ctermfg=white guifg=white guibg=black
" windows size and postion
winpos 10 50    
set lines=45 columns=130
"
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut Key Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
map <LEADER>f :source ~/.vimrc<CR>
map <LEADER>w :w!<CR>
map <LEADER>q :q!<CR>
map <C-a> ggVG

map sr :set splitright<CR>:vsplit<CR>   " right split screen
map sl :set nosplitright<CR>:vsplit<CR> " left 
map su :set nosplitbelow<CR>:split<CR>  " above 
map sb :set splitbelow<CR>:split<CR>    " below 

map <LEADER>l <C-w>l    " the cursor changes to the right screen
map <LEADER>h <C-w>h    " changes to the left 

map sv <C-w>t<C-w>H " switch from above/below split screen to left/right split screen
map sh <C-w>t<C-w>K " switch from left/right split screen to above/below split screen 

map tb :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc

"compile and run
map <LEADER>c :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"C,C++ debug
map <LEADER>r :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug Install
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')   " need junegunn/vim-plug support

" status line
Plug 'vim-airline/vim-airline'  
" Color theme
Plug 'connorholyday/vim-snazzy' 

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Other useful utilities
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color snazzy
" let g:SnazzyTransparent = 1 " transparent background

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" nerdtree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" youcompleteme
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/bin/python3"
let g:ycm_python_binary_path = "/bin/python3"

" ale
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" taglist
map <C-t> T :TagbarOpenAutoClose<CR>

" Python-syntax
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" Undotree
let g:undotree_DiffAutoOpen = 0
map <C-d> :UndotreeToggle<CR>

" vim-indent-guide
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New File Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Li Haipeng")
        call append(line(".")+2, "\# mail: lihaipeng_buaa@163.com")
        call append(line(".")+3, "\# Created Time:".strftime("%c"))
        call append(line(".")+4,"\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "") 
    elseif &filetype == 'python'
        call setline(1,"#########################################################################")
        call append(line("."), "# File Name: ".expand("%"))
        call append(line(".")+1, "# Author: Li Haipeng")
        call append(line(".")+2, "# mail: lihaipeng_buaa@163.com")
        call append(line(".")+3, "# Created Time:".strftime("%c"))
        call append(line(".")+4,"#########################################################################")
        call append(line(".")+5, "#!/usr/bin/python")
        call append(line(".")+6, "# -*- coding:utf-8 -*-")
        call append(line(".")+7, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Li Haipeng")
        call append(line(".")+2, "    > Mail: lihaipeng_buaa@163.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4," ************************************************************************/")
        call append(line(".")+5, "") 
	endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
        call append(line(".")+10, "int main(void){")
        call append(line(".")+11, "")
        call append(line(".")+12, "    return 0;")
        call append(line(".")+13, "}")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main(void){")
        call append(line(".")+9, "")
        call append(line(".")+10,"  return 0;")
        call append(line(".")+11, "}")
    endif
    " After creating a new file, automatically locate to the end of the file
    autocmd BufNewFile *normal G
endfun

" source vim config immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRCc
