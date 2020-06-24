""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
winpos 10 50    " 设定窗口位置  
set lines=45 columns=130    " 设定窗口大小
syntax on   " 语法高亮
set number  " 显示行号 
set cursorline  "显示当前行的标尺
set wrap    " 超出规定范围自动换行
set showcmd " 输入的命令显示出来，看的清楚些
set wildmenu    " 显示可选命令菜单
set hlsearch    " 搜索结果高亮
set incsearch   " 搜索逐字符高亮
set autoindent  " 自动缩进
set smartindent " 智能缩进
set smartcase   " 智能大小写
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠
set foldmethod=indent   " 自动折叠
set autoread    " 文件被改动时自动载入
set completeopt=preview,menu    " 代码补全
filetype on " 侦测文件类型
filetype plugin on  " 载入文件类型插件
filetype indent on  " 为特定文件类型载入相关缩进文件
filetype plugin indent on
set autowrite   " 自动保存
set confirm " 设置未保存时候，弹出确认
set noswapfile  " 禁止生成临时文件
set nowritebackup   " 取消写文件备份
set nobackup  " 取消文件备份
set showmatch   " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）
set tabstop=4   " Tab键的宽度
set softtabstop=4
set shiftwidth=4
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936   " 设置编码自动识别, 中文引号显示 
set fileencoding=utf-8
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 显示中文帮助
if version >= 603
set helplang=cn
set encoding=utf-8
endif
" set ignorecase    " 忽略大小写
" set background=dark   " 背景使用黑色 
" set go=   " 不要图形按钮
" color asmanian2   " 设置背景主题
" set guifont=Courier_New:h10:cANSI " 设置字体
" set ruler " 设置标尺
" set gdefault    " 行内替换
" set foldmethod=manual   " 手动折叠  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建文件设置
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
    "新建文件后，自动定位到文件末尾
	autocmd BufNewFile *normal G
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
map <LEADER>f :source ~/.vimrc<CR>
map <LEADER>w :w!<CR>
map <LEADER>q :q!<CR>
map <C-a> ggVG

map sr :set splitright<CR>:vsplit<CR>   " 右分屏
map sl :set nosplitright<CR>:vsplit<CR> " 左
map su :set nosplitbelow<CR>:split<CR>  " 上
map sb :set splitbelow<CR>:split<CR>    " 下

map <LEADER>l <C-w>l    " 光标换到右屏
map <LEADER>h <C-w>h    " 光标换到左屏

map sv <C-w>t<C-w>H " 上下分屏切换为左右分屏 
map sh <C-w>t<C-w>K " 左右分屏切换为上下分屏

map tb :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"按F5编译运行
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
"C,C++的调试
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
" 插件设置
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




