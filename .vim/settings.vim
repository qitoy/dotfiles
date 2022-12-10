scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

" colorscheme
set background=dark
augroup vimrc
  autocmd ColorScheme * highlight Normal ctermbg=none
  autocmd ColorScheme * highlight NonText ctermbg=none
  autocmd ColorScheme * highlight LineNr ctermbg=none
  autocmd ColorScheme * highlight Folded ctermbg=none
  autocmd ColorScheme * highlight SignColumn ctermbg=none
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
augroup END
colorscheme iceberg

" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

nmap <leader> <Plug>(leader)

" for cpp-library
execute 'set path+=' . expand('~/Library/cpp-library')

" 便利コマンド
command! -nargs=* Make
\ call vimrc#make(<f-args>)
command! SourceVimrc
\ source ~/.vimrc

" 後でなんかするかも
nnoremap Q <Nop>
" nnoremap q <Nop> マクロ大事
nnoremap m <Nop>

" <BS>の挙動変更
set backspace=indent,eol,start

" コマンド表示
set showcmd

" コマンドラインでの動き
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <Esc> <Nop>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>b <S-Left>
cmap <Esc><Esc> <Plug>(cedit)
cnoremap <expr> <Plug>(cedit) &cedit

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
nnoremap s <Nop>
xnoremap s <Nop>
nnoremap Y y$

" 移動関連
nnoremap <silent> j gj
nnoremap <silent> k gk
set scrolloff=10

" 折りたたみ
set foldenable
set foldmethod=marker

" tab
set tabstop=4
set shiftwidth=4
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
nnoremap <C-S> <Cmd>update<CR>

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
