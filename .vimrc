scriptencoding utf-8

" leader関連
let g:mapleader = ' '
let g:maplocalleader = '\'

" {{{1 dein Scripts-----------------------------

let g:dein#auto_recache = v:true

let s:toml = '~/.vim/dein.toml'
let s:toml_lazy = '~/.vim/dein_lazy.toml'
let s:ddc_toml = '~/.vim/ddc.toml'
let s:ddu_toml = '~/.vim/ddu.toml'
let s:skkeleton_toml = '~/.vim/skkeleton.toml'

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:toml_lazy, {'lazy': 1})
call dein#load_toml(s:ddc_toml, {'lazy': 1})
call dein#load_toml(s:ddu_toml, {'lazy': 1})
call dein#load_toml(s:skkeleton_toml, {'lazy': 1})

" Required:
call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" }}}1 End dein Scripts-------------------------

runtime! /init/secret.vim

" フォント設定
" set guifont=SourceCodeProForPowerline-Regular:h11

" 便利コマンド
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
	\ | diffthis | wincmd p | diffthis

" LaTeX
let g:tex_flavor = "latex"
let g:tex_conceal=''
aug LaTeX
	au!
	au FileType tex inoremap <buffer> <Bslash>[ <Bslash>[<Bslash>]<Left><Left><CR><CR><Up><C-F>
	au BufNewFile *.tex 0r $HOME/.vim/template/LaTeX.tex
	au BufNewFile *.tex %s/Title_Here/\=expand("%:t:r")/
	au InsertLeave,CursorHold *.tex update
aug END

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

set autowrite
set laststatus=2
