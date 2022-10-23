scriptencoding utf-8

" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

nmap <leader> <Plug>(leader)

" 便利コマンド
command! -nargs=* Make
\ call vimrc#make(<f-args>)

" 後でなんかするかも
nnoremap Q <Nop>
nnoremap q <Nop>
nnoremap m <Nop>

" <BS>の挙動変更
set backspace=indent,eol,start

" 行番号を表示
set number

" tabの幅
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set softtabstop=-1
set expandtab

" コマンド表示
set showcmd

" コマンドラインでの動き
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
nnoremap Y y$

" 移動関連
nnoremap <silent> j gj
nnoremap <silent> k gk
set scrolloff=10

" 折りたたみ
set foldenable
set foldmethod=marker

" map関連
set timeout timeoutlen=3000 ttimeoutlen=100

" 横スクロール
set nowrap
set sidescroll=1
set sidescrolloff=20

" 整形
set virtualedit=block

set updatetime=100

" 保存
set autowrite
nnoremap <C-S> <Cmd>update<CR>
inoremap <C-S> <Cmd>update<CR>

" 表示
set laststatus=2

" undo永続化
set undofile
if has('nvim')
  let &undodir = expand('~/.vim/nundo/')
else
  let &undodir = expand('~/.vim/undo/')
endif

" マウス
set mouse=

" -------------------------------------
" GUI関連
" -------------------------------------
if !has('gui_running')
  finish
endif
" フォント設定
set guifont=SourceCodeProForPowerline-Regular:h11
set guifontwide=HiraMinProN-W3:h11
set antialias

" ウィンドウサイズ
set columns=100 lines=48

" タブページ
set showtabline=2

set guioptions+=ci!
set guioptions-=r
