" let

" 文件类型检测
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 开启语法高亮
if !exists("g:syntax_on")
      syntax enable
endif

" 矫正部分配色
let &t_ut=''

" 打开时运行指令 取消上回搜索内容的高亮
exec "nohlsearch"

" txt文件按照wiki语法高亮
autocmd BufNewFile *.txt set ft=confluencewiki 
autocmd BufEnter *.txt set ft=confluencewiki

"光标定义
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 恢复上次文件打开位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 将leader键（\键）换成空格
let mapleader=" "
"=========
"===END===
"===set===
set nocompatible			     	" 不兼容 VI ,compatible为兼容(tab将不会变成空格)
set fileencodings=utf-8,gbk		     	" 写入文件时采用的编码类型
set termencoding=utf-8	   		     	" 输出到终端时采用的编码类型
set encoding=utf-8	   		     	" 缓存的文本、寄存器、Vim 脚本文件等
set guifont=YaHei\ Consolas\ Hybrid\ 11.5    	" 设置显示字体为YaHei Consolas Hybrid
set number		   		     	" 显示行号	缩写： nu
set relativenumber	   		     	" 从当前行向前向后算行数
set cursorline		   		     	" 突出显示当前行	缩写： cul
"set cursorcolumn	   		     	" 突出显示当前列	缩写： cuc
set showmatch		   		     	" 显示括号匹配
set showcmd		   		     	" 显示指令
set laststatus=2	   		     	" 显示状态栏
set ruler		   		     	" 显示光标当前位置
set wrap		   		     	" 自动换行
set tw=0		   		     	" 防止自动分割行
set expandtab		   		     	" 将制表符扩展为空格
set softtabstop=4  		     	" 把连续数量的空格视为一个制表符
set tabstop=4		   		     	" 制表符长度为4空格	缩写：ts
set shiftwidth=4	   		     	" 自动缩进长度为4空格
set autoindent		   		     	" 自动缩进 缩写:ai
set cindent		   		     	" c格式自动缩进
set smartindent		   		     	" 开启智能对齐
set foldmethod=syntax			     	" 基于缩进或语法进行代码折叠 indent（基于缩进）、syntax(基于语法)  
set nofoldenable			     	" 启动 vim 时关闭折叠代码
set wildmenu					" 命令补全
set autochdir       				" 在当前目录下执行命令
set hlsearch					" 高亮显示搜索
set incsearch					" 动态高亮搜索"
set ignorecase					" 不区分大小写搜索
set smartcase					" 智能大小写搜索
set mouse=a					" 使用鼠标
set backspace=indent,eol,start			" 能退格到行尾
"=========
"===END===
"===map===
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/
map Q :q<CR>
map S :w<CR>
map <C-c> <Esc>
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz
noremap W 5w
noremap B 5b
noremap s <nop>
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>
map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
map ml :bn<CR>
map mh :bp<CR>
noremap <LEADER><CR> :nohlsearch<CR>
noremap J 5j
noremap K 5k

" vim-plug
call plug#begin('~/.vim/plugged')
" 底栏显示文件目录
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 显示目录树
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" 括号颜色
Plug 'frazrepo/vim-rainbow'
" 选中文本
Plug 'kana/vim-textobj-user'
" 括号补全
Plug 'jiangmiao/auto-pairs'
" 代码补全
Plug 'neoclide/coc.nvim'
" 多光标
Plug 'terryma/vim-multiple-cursors'
" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for':['text', 'markdown', 'vim-plug']  }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown','vim-plug']  }
Plug 'dkarter/bullets.vim'
" sudo
Plug 'lambdalisue/suda.vim'
" python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug']  }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug']  }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug']  }
call plug#end()

" vim-airline
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif 
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" NerdTree
map tt :NERDTreeToggle<CR>
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

" NerdTree-git
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

set  shell=bash\ -i
let g:instant_markdown_browser = "google-chrome-stable"
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_allow_unsafe_content = 1

let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-explorer',
    \ 'coc-flutter-tools',
    \ 'coc-gitignore',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-stylelint',
    \ 'coc-syntax',
    \ 'coc-tasks',
    \ 'coc-todolist',
    \ 'coc-translator',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \ 'coc-yank']
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
        call CocActionAsync('highlight')
            if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
            endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>

" suda
let g:suda_smart_edit = 1
