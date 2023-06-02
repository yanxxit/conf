" ------------------------------- 插件 --------------------------------
call plug#begin('~/.vim/plugged')
" ------ 美化 ------
" theme
Plug 'ghifarit53/tokyonight-vim'

" 底部栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 背景色
Plug 'altercation/vim-colors-solarized'


" ------ 文件 ------
" 启动 辅助功能
Plug 'mhinz/vim-startify'

" file tree
" https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree'

" ------------------- search -------------------
" git clone --depth 1 https://ghproxy.com/https://github.com/junegunn/fzf.git ~/.fzf
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf' " 已安装后不需要后面的
Plug 'junegunn/fzf.vim'
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}

" ack命令在vim中的快速检索
Plug 'mileszs/ack.vim'

" 光标快速移动
Plug 'easymotion/vim-easymotion'

" terminal
Plug 'voldikss/vim-floaterm'

" ---- code 编码 ----
" 函数列表
Plug 'preservim/tagbar'

" 对齐问题
Plug 'godlygeek/tabular'

" Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 分割线
Plug 'Yggdroot/indentLine'
" 代码彩虹括号
Plug 'luochen1990/rainbow'

" 括号自动补全插件
Plug 'jiangmiao/auto-pairs'

" editorconfig
Plug 'editorconfig/editorconfig-vim'


" 注释
Plug 'scrooloose/nerdcommenter'

Plug 'garbas/vim-snipmate'

" ------------------- 语言 -------------------
Plug 'vim-scripts/L9'
Plug 'mattn/emmet-vim'

Plug 'othree/html5.vim'

Plug 'moll/vim-node'            " node.js
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
" format
Plug 'maksimr/vim-jsbeautify'

" python
Plug 'hdima/python-syntax'
" golang
" Plug 'fatih/vim-go'

" shell
Plug 'shougo/vimshell.vim'


Plug 'plasticboy/vim-markdown'

call plug#end()

" ------------------------------- 通用配置 --------------------------------

set number " 显示行号
set relativenumber " 设置相对的行号
set ruler

set autoread " 自动加载

" https://blog.csdn.net/zf766045962/article/details/90052374
set backspace=2

"设置不产生swp文件
set nobackup
set autochdir

" 代码缩进
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2

set expandtab
set showmode

" code scheme 
syntax enable
syntax on

"文件编码模式指定utf
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8


filetype on " 开启文件类型侦测
filetype indent on " 自适应不同语言的智能缩进
filetype plugin on " 根据侦测到的不同类型加载对应的插件

" 搜索配置
set hlsearch " 高亮显示搜索结果：
set incsearch " 开启实时搜索功能，设置当每键入一个字符时，就搜索
set ignorecase " 搜索时大小写不敏感

set nocompatible " 关闭兼容模式，不兼容vi，这样可以发挥vim的很多强大功能。
" vim 自身命令行模式智能补全 :set nu ==> set number
set wildmenu

" set mouse="" " 禁鼠标，这个不禁vim右键会出一个弹窗，挺难受的。

set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度



" ------------------------------- 设置主题 --------------------------------
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tokyonight_transparent_background = 1 
" ------------------------------- vim-airline --------------------------------
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
"let g:airline_theme='moloai'  " murmur配色不错

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" ------------------------------- 目录树 --------------------------------
" control + t 打开或者关闭
noremap <c-t> :NERDTreeToggle<CR>
" control + l 订位所在位置location
noremap <c-l> :NERDTreeFind<CR>

" ------------------------------- 快速搜索fzf --------------------------------
" 按 control + p 就可以快速搜索
noremap <c-p> :Files<CR>
" 按 control + g 可以快速全局模糊搜索（上面是只搜文件）
noremap <c-g> :Ag<CR>

" \ + f + u 方法罗列搜索 tracyone/fzf-funky
nnoremap <Leader>fu :FzfFunky<Cr>

" tagbar Control + u
nmap <C-u> :TagbarToggle<CR>

" easymotion 把光标快速移动 到你的可视区域
nmap ss <Plug>(easymotion-s2)


" ------------------------------- coc --------------------------------
" # ~/.config/nvim/init.vim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ------------------------------- Terminal --------------------------------
" 终端模式下, 切换终端 
" ctrl + n
tnoremap <silent> <C-n> <C-\><C-n>:FloatermNext<CR>
" 新建terminal windows
let g:floaterm_keymap_new = '<Leader>tw'
" 切换terminal模式
let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'
" 终端宽(0,1)
let g:floaterm_width = 0.6
" 终端高(0,1)
let g:floaterm_height = 0.4
" 终端标题
let g:floaterm_title = 'floaterm: $1/$2'

" ------------------------------- vim-jsbeautify --------------------------------
" ctrl + f: format
map <c-f> :call JsBeautify()<cr>

" ------------------------------- 安装 --------------------------------
" :PlugInstall
" :PlugStatus

" 1. 安装vim
" 2. curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/yanxxit/conf/main/vim-plug.install.vim
" 3. 更换plug.vim  ==> 切换为kgithub.com  ==> vim-plug.plug.vim
" 4. curl -fLo ~/.vimrc https://ghproxy.com/https://raw.githubusercontent.com/yanxxit/conf/main/.vimrc