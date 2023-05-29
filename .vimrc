" ------------------------------- 通用配置 --------------------------------

set number " 显示行号
set relativenumber " 设置相对的行号
set ruler

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

" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全 :set nu ==> set number
set wildmenu

set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度

" ------------------------------- 插件 --------------------------------
call plug#begin('~/.vim/plugged')

" 启动 辅助功能
Plug 'mhinz/vim-startify'

" 提示
Plug 'neoclide/coc.nvim'

" file tree
" https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree'

" 
Plug 'preservim/tagbar'

" theme
Plug 'ghifarit53/tokyonight-vim'

" 底部栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 分割线
Plug 'Yggdroot/indentLine'

Plug 'luochen1990/rainbow'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" ------------------- search -------------------
" git clone --depth 1 https://ghproxy.com/https://github.com/junegunn/fzf.git ~/.fzf
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf' " 已安装后不需要后面的
Plug 'junegunn/fzf.vim'
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}


" 光标快速移动
Plug 'easymotion/vim-easymotion'

"ack命令在vim中的快速检索
Plug 'mileszs/ack.vim'

" terminal
Plug 'voldikss/vim-floaterm'

" ------------------- 语言 -------------------
Plug 'vim-scripts/L9'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
" Plug 'fatih/vim-go'

" html + js + node
Plug 'othree/html5.vim'
Plug 'moll/vim-node'
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" python
Plug 'hdima/python-syntax'

call plug#end()

" ------------------------------- 设置主题 --------------------------------
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tokyonight_transparent_background = 1 
" ------------------------------- 目录树 --------------------------------
" control + t 打开或者关闭
noremap <c-t> :NERDTreeToggle<CR>
" control + f 订位所在位置
noremap <c-f> :NERDTreeFind<CR>

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

" ------------------------------- 安装 --------------------------------
" :PlugInstall
" :PlugStatus

" 1. 安装vim
" 2. curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/yanxxit/conf/main/vim-plug.install.vim
" 3. 更换plug.vim  ==> 切换为kgithub.com  ==> vim-plug.plug.vim
" 4. curl -fLo ~/.vimrc https://ghproxy.com/https://raw.githubusercontent.com/yanxxit/conf/main/.vimrc