scriptencoding utf-8

" colorscheme
set background=dark
autocmd vimrc VimEnter * ++once colorscheme carbonfox

" <BS>の挙動変更
set backspace=indent,eol,start

" コマンド表示
set showcmd

" 移動関連
set scrolloff=10

" 折りたたみ
set foldenable
set foldmethod=marker

" tab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set softtabstop=-1
set expandtab

" map関連
set timeout timeoutlen=3000 ttimeoutlen=100

" 横スクロール
set nowrap
set sidescroll=1
set sidescrolloff=20

" 整形
set virtualedit=block
set formatoptions+=jM

set updatetime=100

" 保存
set autowrite

" 表示
set laststatus=3
set signcolumn=no
set nohlsearch

" undo永続化
set undofile
let &undodir = expand('~/.vim/nundo/')

" マウス
set mouse=
