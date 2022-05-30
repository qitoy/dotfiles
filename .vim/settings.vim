augroup vimrc
	autocmd!
augroup END

runtime! /init/secret.vim

" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

" フォント設定
" set guifont=SourceCodeProForPowerline-Regular:h11

" 便利コマンド
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
	\ | diffthis | wincmd p | diffthis

" <BS>の挙動変更
set backspace=indent,eol

" 行番号を表示
set number

" tabの幅
set tabstop=4
set shiftwidth=4
let g:vim_indent_cont = shiftwidth()

" コマンド表示
set showcmd

" 括弧補完
inoremap {<CR> {}<Left><CR><CR><Up><C-f>

" レジスタ関連
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
" set clipboard+=unnamed

" 移動関連
nnoremap <silent> j gj
nnoremap <silent> k gk
set scrolloff=10

" 折りたたみ
set foldmethod=marker
aug folding
	au!
	autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
	autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
aug END
set viewoptions-=options

" map関連

" 横スクロール
set nowrap
set sidescroll=1
set sidescrolloff=20

" 折り返し
" set wrap
" set breakindent
" set breakindentopt=shift:4,sbr
" let &showbreak='===>'
" set linebreak

" 整形
set formatoptions+=jM

" 危険なのでコメントアウト
" autocmd vimrc SourcePre * update

set virtualedit=block

set autowrite
set laststatus=2
