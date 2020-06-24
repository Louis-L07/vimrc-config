""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  " remove the vi consistency mode
set shortmess=atI   " do not show the prompt to assist Ugandan children when starting
winpos 10 50    
set lines=45 columns=130    " window size
syntax on   " highlight
set number   
set cursorline  " mark current line
set wrap    
set showcmd  
set wildmenu    " show optional command menu
set hlsearch    " search results highlighted
set incsearch   " character by character highlighted 
set autoindent  
set smartindent 
set smartcase   
set laststatus=1    
set foldenable      
set foldmethod=indent   
set autoread    " auto read when the file is changed
set completeopt=preview,menu    " code completion
filetype on " detect file type
filetype plugin on  " plugin file
filetype indent on  " indent file
filetype plugin indent on
set autowrite   
set confirm 
set noswapfile  
set nowritebackup   
set nobackup  
set showmatch   
set matchtime=1 " the time of highlight matched bracket
set tabstop=4   " width of tab-key
set softtabstop=4
set shiftwidth=4
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936   
set fileencoding=utf-8
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" show chinese help
if version >= 603
set helplang=cn
set encoding=utf-8
endif
" set ignorecase
" set background=dark   
" set go=   " no graphic buttons
" color asmanian2   
" set guifont=Courier_New:h10:cANSI " font setup
" set ruler 
" set gdefault    
" set foldmethod=manual   

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
endfunc

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




