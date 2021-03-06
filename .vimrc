"缩进配置
"'继承前一行的缩进方式，适用于多行注释'autoindent
set autoindent smartindent shiftround
"设置自动缩进长度为4空格'
set shiftwidth=4
"设置Tab长度为4空格'
set tabstop=4
set softtabstop=4                " insert mode tab and backspace use 4 spaces "
set list

"显示行号'
set nu
"set number

"突出当前行
set cursorline
"set cul          
"cursorline的缩写形式'

"突出当前列
"set cursorcolumn
"set cuc		"cursorcolumn的缩写形式'

"显示空格tab缩进
set listchars=tab:>-,trail:-

"总是显示状态栏'
"set laststatus=2
"显示光标当前位置'
set ruler

" 打开文件类型检测 "
filetype on
" 打开语法高亮显示 "
syntax on

"让vimrc配置变更立即生效,OK
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" .git、.svn、.root等文件用于查看文件的根路径，否则不生成tag
" 自动跳转 Ctrl + W + ] 新窗口查看函数定义 Ctrl -W } 窗口预览光标下符号定义
" 在为当前目录生成tags文件后，可以通过按键 Ctrl + ] 跳转到对应的定义位置，再使用命令 Ctrl + o 回退到原来的位置。
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
"
" 所生成的数据文件的名称 
let g:gutentags_ctags_tagfile = '.tags'
"
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
"
"配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim
"powerline的安装路径，可能需要自行调整'
set laststatus=2  
"设置vim状态栏数量为2，用于显示powerline的内容'
set showtabline=2 
"始终显示窗口上头的tabline'
set noshowmode    
"Hide the default mode text (e.g. -- INSERT -- below the statusline)'
set t_Co=256

"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py

call plug#begin('~/.vim/plugged')
"代码自动补全插件
Plug 'https://github.com/Valloric/YouCompleteMe.git'
"函数跳转插件
Plug 'ludovicchabant/vim-gutentags'
"工程项目树展示插件
Plug 'https://github.com/scrooloose/nerdtree'
"模糊搜素插件ctrlp
Plug 'ctrlpvim/ctrlp.vim'
"配色方案
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
