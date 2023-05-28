" ------------------------------- 通用配置 --------------------------------
set number
" 设置相对的行号
set relativenumber

" 代码缩进
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2

" code scheme 
syntax enable
syntax on

" 开启文件类型侦测
filetype on
" 自适应不同语言的智能缩进
filetype indent on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on


" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度

" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
" autocmd VimEnter * call ToggleFullscreen()


" ------------------------------- 插件 --------------------------------
call plug#begin('~/.vim/plugged')

" 启动 辅助功能
Plug 'mhinz/vim-startify'

" 提示
Plug 'neoclide/coc.nvim'

" file tree
Plug 'preservim/nerdtree'

" theme
Plug 'ghifarit53/tokyonight-vim'

" 底部栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 分割线
Plug 'Yggdroot/indentLine'

" 光标快速移动
Plug 'easymotion/vim-easymotion'
" 
Plug 'preservim/tagbar'

Plug 'luochen1990/rainbow'

" editorconfig
Plug 'editorconfig/editorconfig-vim'


" 此处为将fzf安装到 ~/.fzf 目录，并执行 ./install --all 命令
" git clone --depth 1 https://ghproxy.com/https://github.com/junegunn/fzf.git ~/.fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
" 已安装后不需要后面的
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}

" vim-cheat-sheet 插件
Plug 'dbeniamine/vim-cheat-sheet'
" :CheatSheet

" 语言
Plug 'vim-scripts/L9'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
" Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'hdima/python-syntax'

call plug#end()

" ------------------------------- 设置主题 --------------------------------
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

let g:tokyonight_transparent_background = 1 

" 设置文件

" <leader> ==> \
" <C-n> ==> control + n
" silent

" 树形结构
" noremap <leader>t:NERDTreeToggle<CR>
" noremap <leader>f:NERDTreeFind<CR>

" 目录树
" control + t
noremap <c-t> :NERDTreeToggle<CR>
" control + f
noremap <c-f> :NERDTreeFind<CR>
" control + n
nnoremap <C-n> :NERDTree<CR>

" fzf 
" 按 control + p 就可以快速搜索
noremap <c-p> :Files<CR>
" 按 control + g 可以快速全局模糊搜索（上面是只搜文件）
noremap <c-g> :Ag<CR>

" \ + f + u
nnoremap <Leader>fu :FzfFunky<Cr>
" 方法罗列搜索
" tracyone/fzf-funky
nnoremap <c-fu>:FzfFunky<Cr>


" tagbar
" 设置 Control + u 作为映射快捷键
nmap <C-u> :TagbarToggle<CR>


" easymotion 该插件是让你可以在vim 中 把光标快速移动 到你的可视区域
nmap ss <Plug>(easymotion-s2)

" ------------------------------- 安装 --------------------------------
" :PlugInstall
" :PlugStatus
" :PlugUpdate
" :PlugDiff
" :FloatermNew
" 更换源后，需要先将之前的插件清理，在安装才可用
" :PlugClean

" 给出一个在线的配置
" github.com/vim/config
" 1. 安装vim
" 2. curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. curl -fLo ./vim-plug.plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 3. 更换plug.vim  ==> 切换为kgithub.com  ==> vim-plug.plug.vim
" 获取配置文件
" 4. curl -fLo ~/.vimrc --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim